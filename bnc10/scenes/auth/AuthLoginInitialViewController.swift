import UIKit
import FirebaseAuth

class AuthLoginInitialViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pinTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: Actions
    @IBAction func doLogin(_ sender: UIButton) {
        if Validator.isValidEmail(email: (emailTextField?.text)!) && (pinTextField.text?.count)! > 0 {
            AuthService.createUser(email: emailTextField.text!, password: pinTextField.text!,
               onSuccess: {() -> () in
                    print("success")
                }, onError: { (error) -> () in
                    let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                })
        }
    }
    
}
