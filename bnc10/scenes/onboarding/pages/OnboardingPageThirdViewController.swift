import UIKit

class OnboardingPageThirdViewController: UIViewController {

    // MARK: Properties
    /*
     @IBOutlet weak var labelTitle: UILabel!
     @IBOutlet weak var labelDescription: UILabel!
     @IBOutlet weak var buttonContinue: UIButton!
     @IBOutlet weak var buttonGotoRegistration: UIButton!
     */
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var buttonContinue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupButtons()
    }
    
    func setupLabels() {
        labelTitle.text = NSLocalizedString("onboarding-page-third-title", comment: "")
        labelDescription.text = NSLocalizedString("onboarding-page-third-desc", comment: "")
        labelDescription.lineBreakMode = .byWordWrapping
        labelDescription.numberOfLines = 0
    }
    
    func setupButtons() {
        buttonContinue.layer.cornerRadius = 30
        buttonContinue.clipsToBounds = true
        buttonContinue.backgroundColor = UIColor(red: 0.258823, green: 0.749019, blue: 0.956862, alpha: 1) // rgb(66, 191, 244)
        buttonContinue.setTitleColor(.white, for: .normal)
        buttonContinue.setTitle(NSLocalizedString("onboarding-page-button-continuemos", comment: ""), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
