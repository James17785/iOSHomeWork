//
//  ChartListViewController.swift
//  ChartList
//
//  Created by VAM TEAM on 20/2/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import SwiftRandom
import Alamofire
import SwiftyJSON

class ChartListViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .plain)
    let singleChatView = SingleChartViewController()
    var chatList:JSON = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "微信"
//        self.tabBarItem.image = UIImage(named: "selectWeixin")
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self , action: nil)
        self.navigationController?.navigationItem.setLeftBarButton(nil, animated: true)
        self.networkRequest()
        
//        Service.networkRequest("chatlistData", chatListCallback, errorHandle)
        // Do any additional setup after loading the view.
    }

    
    
    //MARK: - Register cell
    func addTableview() {
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ChartListCell.self, forCellReuseIdentifier: "ChatListCell")
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
    }
    
    func networkRequest(){
        let path = Bundle.main.path(forResource: "chatlistData", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        Alamofire.request(url)
            .responseJSON { response in
                
                
                print("result==\(response.result)")   // 返回结果，是否成功
                switch response.result {
                case.success(let resp):
                    let dataFormat = JSON(resp)
                    self.chatList = dataFormat["response"]["chatList"]
                    print("success======", resp)
                    self.addTableview()
                    
                    break
                case .failure(let respErr):
                    print("error======",respErr)
                    break
                }
                
        }
    }

}

extension ChartListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ChartListCell = tableView.dequeueReusableCell(withIdentifier: "ChatListCell") as! ChartListCell
        
        let item = self.chatList[indexPath.row]
        let chatMode = ChatListModel(jsonData: item)
        let url = URL(string: chatMode.avatarUrl)
        
        cell.avatarImageView.kf.setImage(with: url)
        cell.nickNameLabel.text = chatMode.nickName
        cell.recentMessageLabel.text = chatMode.recentMsg
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        singleChatView.hidesBottomBarWhenPushed = true
        
        let item = self.chatList[indexPath.row]
        let chatMode = ChatListModel(jsonData: item)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: chatMode.nickName, style: .plain, target: self , action: nil)
        navigationController?.pushViewController(singleChatView, animated: true)
        
        
//        self.present(uiView, animated: true, completion: nil)
    }
    
    
    
}
