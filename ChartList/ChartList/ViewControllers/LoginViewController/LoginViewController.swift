
import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var userNameVal:String = ""
    var passwordVal:String = ""
    let loginButton = UIButton(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "Login"
        self.hidesBottomBarWhenPushed = true
        
        self.loginPage()
        // Do any additional setup after loading the view.
    }
    
    func loginPage(){
        let userNameLabel = UILabel(frame: .zero)
        userNameLabel.text = "Username:"
        let userNameTextField = UITextField(frame: .zero)
        userNameTextField.borderStyle = .roundedRect
        self.userNameVal = userNameTextField.text ?? "user"
        userNameTextField.placeholder = "user"
        
        let passwordLabel = UILabel(frame: .zero)
        passwordLabel.text = "Password:"
        let passwordTextField = UITextField(frame: .zero)
        passwordTextField.borderStyle = .roundedRect
        self.passwordVal = passwordTextField.text ?? "123"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "123"
        
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.setTitle("Verifing", for: .selected)
        loginButton.backgroundColor = UIColor.red
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginButton.isEnabled = true
        
        
        view.addSubview(userNameLabel)
        view.addSubview(passwordLabel)
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        userNameLabel.snp.makeConstraints { (make) in
             make.top.equalTo(AppConstraint.Login.topSpace)
            make.left.equalTo(AppConstraint.Login.leftSpace)
            make.width.equalTo(AppConstraint.Login.labelWidth)
            make.height.equalTo(AppConstraint.Login.labelHeight)
        }
        userNameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(AppConstraint.Login.topSpace)
            make.left.equalTo(userNameLabel.snp.right).offset(50)
            make.right.equalToSuperview().offset(-20)
        }
        passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userNameLabel.snp.bottom).offset(30)
            make.left.equalTo(AppConstraint.Login.leftSpace)
            make.width.equalTo(AppConstraint.Login.labelWidth)
            make.height.equalTo(AppConstraint.Login.labelHeight)
        }
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(userNameLabel.snp.bottom).offset(30)
            make.left.equalTo(passwordLabel.snp.right).offset(50)
            make.right.equalToSuperview().offset(-20)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLabel.snp.bottom).offset(50)
            make.left.equalTo(AppConstraint.Login.leftSpace)
            make.centerX.equalToSuperview()
            make.width.equalTo(AppConstraint.Login.labelWidth)
            make.height.equalTo(40)
        }
        
//        make.left.top.equalTo(AppConstraint.Common.leftSpace)
//        make.bottom.equalToSuperview().offset(-AppConstraint.Common.leftSpace)
//        make.width.height.equalTo(AppConstraint.Common.avatarWidth)
        
//        make.left.equalTo(avatarImageView.snp.right).offset(AppConstraint.Common.leftSpace)
//        make.top.equalTo(avatarImageView).offset(AppConstraint.ChatList.nickNameTopSpace)
//        make.right.equalToSuperview().offset(-AppConstraint.Common.leftSpace)
        
    }
    
    @objc func loginAction(){
        print("loginAction ===> ")
        let charListViewController = ChartListViewController()
        
        let parameters:Dictionary = ["username": userNameVal, "password":passwordVal]
        
        Alamofire.request( "https://httpbin.org/get/login", parameters: parameters)
            .responseJSON { response in
                self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self , action: nil)

                self.navigationItem.hidesBackButton = true;
                self.navigationItem.setHidesBackButton(true, animated: true)
                
                self.navigationController?.pushViewController(charListViewController, animated: true)
        }
        

       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
