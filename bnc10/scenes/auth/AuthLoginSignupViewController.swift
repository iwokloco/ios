import UIKit

class AuthLoginSignupViewController: UIViewController {

    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonSignup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    func setupButtons() {
        buttonLogin.layer.cornerRadius = 10
        buttonLogin.clipsToBounds = true
        buttonLogin.backgroundColor = UIColor(red: 0.258823, green: 0.749019, blue: 0.956862, alpha: 1)
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.setTitle(NSLocalizedString("auth-login-signup-button-login", comment: ""), for: .normal)
        buttonSignup.setTitle(NSLocalizedString("auth-login-signup-button-crea-compte", comment: ""), for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func gotoLogin(_ sender: Any) {
    }
    
    @IBAction func gotoSignup(_ sender: Any) {
    }
    
}
