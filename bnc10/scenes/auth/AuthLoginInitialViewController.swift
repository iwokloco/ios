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
        if Validator.isValidEmail(email: (emailTextField?.text)!) && (pinTextField.text?.count)! > 5 {
            
            AuthService.signIn(email: emailTextField.text!, password: pinTextField.text!,
                               onSuccess: {(authDataResult) -> () in
                                    if authDataResult == nil {
                                        Alert.showAlert(title: "User error", message: "Se produjo un error durante el login", vc: self)
                                    } else {
                                        Alert.showAlert(title: "UID", message: authDataResult?.user.uid ?? "", vc: self)
                                    }
                                },
                               onError: { (error) -> () in
                                    Alert.showErrorAlert(error: error, vc: self)
                                })
            
            
            /*AuthService.createUser(email: emailTextField.text!, password: pinTextField.text!,
               onSuccess: {() -> () in
                    print("success")
                }, onError: { (error) -> () in
                    let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                })*/
        }
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
