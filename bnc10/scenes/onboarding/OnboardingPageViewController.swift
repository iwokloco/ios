//
//  OnboardingPageViewController.swift
//  bnc10
//
//  Created by Ramón HC on 29/6/18.
//  Copyright © 2018 Ramón HC. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UIPageViewControllerDataSource
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
