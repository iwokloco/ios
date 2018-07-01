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

        setupButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupButtons() {
        buttonContinue.layer.cornerRadius = 30
        buttonContinue.clipsToBounds = true
        buttonContinue.backgroundColor = UIColor(red: 0.258823, green: 0.749019, blue: 0.956862, alpha: 1) // rgb(66, 191, 244)
        buttonContinue.setTitleColor(.white, for: .normal)
        buttonContinue.titleLabel?.text = NSLocalizedString("onboarding-page-button-continua", comment: "")
        buttonGotoRegistration.titleLabel?.text = NSLocalizedString("onboarding-page-button-registre", comment: "")
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
