
import UIKit
import SnapKit
import Kingfisher
import SwiftRandom
import Alamofire
import SwiftyJSON

class SingleChartViewController: UIViewController {

    let tableView = UITableView(frame: .zero , style: .plain)
    var messageList:JSON = []
    var chatTo:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "Chat"
        
        
        self.networkRequest()
    }
    
    //MARK: - Register cell
    func addTableview() {
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SingleChartTableViewCell.self, forCellReuseIdentifier: "SingleChatInCell")
        tableView.register(OutwardsChartTableViewCell.self, forCellReuseIdentifier: "SingleChatOutCell")
        tableView.register(SingleChartTableViewCell.self, forCellReuseIdentifier: "SingleChatInImageCell")
        tableView.register(OutwardsChartTableViewCell.self, forCellReuseIdentifier: "SingleChatOutImageCell")
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        //tableView.estimatedRowHeight = 44 ;
        tableView.rowHeight = UITableView.automaticDimension;
        
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    func networkRequest(){
        let path = Bundle.main.path(forResource: "singleChatData", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        Alamofire.request(url)
            .responseJSON { response in
                
                
                print("result==\(response.result)")   // 返回结果，是否成功
                switch response.result {
                case.success(let resp):
                    let dataFormat = JSON(resp)
                    self.messageList = dataFormat["response"]["messageList"]
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


extension SingleChartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "SingleChatInCell") as! ChatModelTableViewCell
        let item = self.messageList[indexPath.row]
        let singleChatMode = SingleChatModel(jsonData: item)
        let url = URL(string: singleChatMode.avatarUrl!)
        
         cell1.avatarImageView.kf.setImage(with: url)
        
        if singleChatMode.role == "receiver", singleChatMode.messageType == "text" {
           let cell = tableView.dequeueReusableCell(withIdentifier: "SingleChatInCell") as! SingleChartTableViewCell
            cell.recentMessageLabel.text = singleChatMode.message
            cell.avatarImageView.kf.setImage(with: url)
            
            return cell
        }else if singleChatMode.role == "sender", singleChatMode.messageType == "text" {
           let cell = tableView.dequeueReusableCell(withIdentifier: "SingleChatOutCell") as! OutwardsChartTableViewCell
            cell.recentMessageLabel.text = singleChatMode.message
            cell.avatarImageView.kf.setImage(with: url)
            
            return cell
        }else if singleChatMode.role == "receiver", singleChatMode.messageType == "image" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleChatInImageCell") as! OutwardsImageViewCell
            let url = URL(string: singleChatMode.imageUrl!)
            cell.messgeImg.kf.setImage(with: url)
            cell.avatarImageView.kf.setImage(with: url)
            
            return cell
        }else if singleChatMode.role == "sender", singleChatMode.messageType == "image" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleChatOutImageCell") as! InWardsImageCell
            let url = URL(string: singleChatMode.imageUrl!)
            cell.messgeImg.kf.setImage(with: url)
            cell.avatarImageView.kf.setImage(with: url)
            
            return cell
        }
        
        
        
//        let url = URL(string: "http://mvimg2.meitudata.com/55fe3d94efbc12843.jpg")
//        cell.avatarImageView.kf.setImage(with: url)
//        cell.recentMessageLabel.text = Randoms.randomFakeNameAndEnglishHonorific()

        
        return cell1
    }
    

}
