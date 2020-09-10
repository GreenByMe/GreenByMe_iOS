//
//  TabbarViewController.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/10.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
      func setTabBar() {
        
        let homeStoryboard = UIStoryboard.init(name:"HomeView",bundle: nil)
          guard let firstTab = homeStoryboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else{return}

          firstTab.tabBarItem.title = "홈"
//        firstTab.tabBarItem.image = UIImage(named: "iconHomeInact")?.withRenderingMode(.alwaysOriginal)
//
//        firstTab.tabBarItem.selectedImage = UIImage(named: "iconHomeAct")?.withRenderingMode(.alwaysTemplate)
          
          let searchStoryboard = UIStoryboard.init(name:"Search",bundle: nil)
          guard let secondTab = searchStoryboard.instantiateViewController(identifier: "SearchViewController") as? SearchViewController else{return}
        //secondTab.univIdx = univIdx
          secondTab.tabBarItem.title = "탐색 "
//        secondTab.tabBarItem.image = UIImage(named: "iconStoreInact")?.withRenderingMode(.automatic)
//
//        //secondTab.tabBarItem.accessibilityFrame = CGRect()
//          secondTab.tabBarItem.selectedImage = UIImage(named: "iconStoreAct")?.withRenderingMode(.alwaysTemplate)
//
          let orderStoryboard = UIStoryboard.init(name:"Certification",bundle: nil)
          guard let thirdTab = orderStoryboard.instantiateViewController(identifier: "OrderViewController") as? CertificationViewController else{return}
        
          thirdTab.tabBarItem.title = "인증"
//          thirdTab.tabBarItem.image = UIImage(named: "iconRocket")?.withRenderingMode(.alwaysOriginal)
//        thirdTab.tabBarItem.imageInsets.top = 0
          //thirdTab.tabBarItem.selectedImage = UIImage(named: "btnTab3Active")?.withRenderingMode(.alwaysTemplate)
          
          let statusStoryboard = UIStoryboard.init(name:"Mypage",bundle: nil)
          guard let fourthTab = statusStoryboard.instantiateViewController(identifier: "MyPageViewController") as? MyPageViewController else{return}
          
          fourthTab.tabBarItem.title = "마이페이지"
//          fourthTab.tabBarItem.image = UIImage(named: "iconHistoryInact")?.withRenderingMode(.alwaysOriginal)
//          fourthTab.tabBarItem.selectedImage = UIImage(named: "iconHistoryAct")?.withRenderingMode(.alwaysTemplate)

          let tabs = [firstTab, secondTab, thirdTab,fourthTab]
        self.setViewControllers(tabs, animated: false)
          self.selectedViewController = firstTab

      }
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//      let itemIndex = tabBarController.selectedIndex
//      if (itemIndex == 0 ){
//        let homeStoryboard = UIStoryboard.init(name:"Home",bundle: nil)
//               guard let firstTab = homeStoryboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else{return}
//        print(firstTab.HomeLottieVie?.subviews)
//
//        firstTab.homeLottieAnimation.reloadImages()
//        firstTab.homeLottieAnimation.play()
//        firstTab.homeLottieAnimation.removeFromSuperview()
//        firstTab.viewDidLoad()
//      }
      if(itemIndex == 2){
        tabBarController.tabBar.isHidden = true
        //tabBarController.viewControllers![2].reloadInputViews()
        let orderStoryboard = UIStoryboard.init(name:"Order",bundle: nil)
        guard let thirdTab = orderStoryboard.instantiateViewController(identifier: "orderView") as? OrderViewController else{return}
        print("jj")
        thirdTab.viewDidLoad()
        print("DD")
      }
      
      else{
        tabBarController.tabBar.isHidden = false
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
