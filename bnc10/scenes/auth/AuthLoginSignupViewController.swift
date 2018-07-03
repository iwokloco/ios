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
        buttonLogin.backgroundColor = Colors.darkBlue
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.setTitle(NSLocalizedString("auth-login-signup-button-login", comment: ""), for: .normal)
        buttonSignup.setTitle(NSLocalizedString("auth-login-signup-button-crea-compte", comment: ""), for: .normal)
        
        // buttonLogin.setGradientBackground(colorOne: Colors.darkBlue, colorTwo: Colors.lightBlue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func gotoLogin(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "authLoginInitialViewController") as? AuthLoginInitialViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func gotoSignup(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "authSignupStep1ViewController") as? AuthSignupStep1ViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
}
