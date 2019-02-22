//
//  ClassifyPageViewController.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/10/17.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit

class ClassifyPageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.present(BaseNavigationController(rootViewController:LoginPageViewController()) , animated: true, completion: nil)
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
