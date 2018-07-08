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
        let validEmail = Validator.isValidEmail(email: (emailTextField?.text)!)
        let pinLength = (pinTextField.text?.count)! > 5
        if validEmail && pinLength {
            AuthService.signIn(email: emailTextField.text!, password: pinTextField.text!,
                               onSuccess: {(authDataResult) -> () in
                                    if authDataResult == nil {
                                        Alert.showAlert(title: "User error", message: "Se produjo un error durante el login", vc: self)
                                    } else {
                                        self.performSegue(withIdentifier: "segueLoginInitialToHome", sender: nil)
                                    }
                                },
                               onError: { (error) -> () in
                                    Alert.showErrorAlert(error: error, vc: self)
                                })
        } else {
            if !validEmail {
                Alert.showAlert(title: "UID", message: "Introdueix un email vàlid.", vc: self)
            } else if !pinLength {
                Alert.showAlert(title: "UID", message: "El PIN ha de ser de 6 dígits.", vc: self)
            }
        }
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
