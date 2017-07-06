//
//  DZTabBarViewController.swift
//  DZHKUFit
//
//  Created by Dora Zhao on 6/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

import UIKit

class DZTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTabChildVC(rootVC: RecomViewController(), title: "推荐", image: "icon")
        self.addTabChildVC(rootVC: ExerciseViewController(), title: "推荐", image: "icon")
        self.addTabChildVC(rootVC: FoodViewController(), title: "推荐", image: "icon")
        self.addTabChildVC(rootVC: PersonInfoTableViewController(), title: "推荐", image: "icon")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTabChildVC(rootVC:UIViewController, title:String, image:String) -> () {
        let nav = UINavigationController.init(rootViewController: rootVC)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage.init(named: image)
        self.addChildViewController(nav)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
