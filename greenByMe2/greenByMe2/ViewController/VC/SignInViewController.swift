//
//  SignInViewController.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

  @IBOutlet weak var email: UITextField!
  @IBOutlet weak var pwd: UITextField!
  @IBAction func sendReq(_ sender: Any) {
    let appserverClient : AppServerClient = AppServerClient()
       appserverClient.signIn(email: email.text!, pwd: pwd.text!) { [weak self] result in
         switch result {
         case .success(let data) :
           guard let data : String = data.data as String else {return}
           print(data)
           print("가입성공")
         case .failure(let error) :
           print(error)
           print("가입실패")
         }
       }
     }
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
