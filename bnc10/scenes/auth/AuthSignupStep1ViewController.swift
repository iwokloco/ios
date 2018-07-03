import UIKit

class AuthSignupStep1ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var buttonImageBack: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var buttonRegistration: UIButton!
    
    /*
     "auth-login-signup-step1-field-name" = "Nom i cognoms";
     "auth-login-signup-step1-field-email" = "Correu electrònic";
     "auth-login-signup-step1-field-phone" = "Número de telèfon";
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupButtons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupLabels() {
        labelTitle.text = NSLocalizedString("auth-login-signup-step1-title", comment: "")
    }
    
    func setupTextFields() {
        textFieldName.placeholder = NSLocalizedString("auth-login-signup-step1-field-name", comment: "")
        textFieldName.attributedPlaceholder = NSAttributedString(string: "placeholder text",
                                                               attributes: [NSAttributedStringKey.foregroundColor: Colors.darkBlue])
    }
    
    func setupButtons() {
        buttonRegistration.layer.cornerRadius = 10
        buttonRegistration.clipsToBounds = true
        buttonRegistration.backgroundColor = Colors.darkBlue
        buttonRegistration.setTitleColor(.white, for: .normal)
        buttonRegistration.setTitle(NSLocalizedString("auth-login-signup-step1-button", comment: ""), for: .normal)
    }

    // MARK: Actions
    @IBAction func gotoNext(_ sender: Any) {        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "authTouchIDViewController") as? AuthTouchIDViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
        
    }
    
    @IBAction func gotoBack(_ sender: UITapGestureRecognizer) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
