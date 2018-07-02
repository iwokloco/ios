//
//  OnboardingPageSecondViewController.swift
//  bnc10
//
//  Created by Ramón HC on 1/7/18.
//  Copyright © 2018 Ramón HC. All rights reserved.
//

import UIKit

class OnboardingPageSecondViewController: UIViewController {


    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var buttonContinue: UIButton!
    @IBOutlet weak var buttonGotoRegistration: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupButtons()
    }
    
    func setupLabels() {
        labelTitle.text = NSLocalizedString("onboarding-page-second-title", comment: "")
        labelDescription.text = NSLocalizedString("onboarding-page-second-desc", comment: "")
        labelDescription.lineBreakMode = .byWordWrapping
        labelDescription.numberOfLines = 0
    }

    func setupButtons() {
        buttonContinue.layer.cornerRadius = 30
        buttonContinue.clipsToBounds = true
        buttonContinue.backgroundColor = UIColor(red: 0.258823, green: 0.749019, blue: 0.956862, alpha: 1) // rgb(66, 191, 244)
        buttonContinue.setTitleColor(.white, for: .normal)
        buttonContinue.setTitle(NSLocalizedString("onboarding-page-button-continua", comment: ""), for: .normal)
        buttonGotoRegistration.setTitle(NSLocalizedString("onboarding-page-button-registre", comment: ""), for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func gotoNextPage(_ sender: Any) {
        let pageViewController = self.parent as! OnboardingPageViewController
        pageViewController.setViewControllers([pageViewController.orderedViewControllers[2]], direction: .forward, animated: true, completion: nil)
        pageViewController.pageControl.currentPage = 2
    }
}
