import UIKit

class AuthLoggedValidateSession: UIViewController {

    @IBOutlet weak var pinTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    @IBAction func doLoginWithPin(_ sender: UIButton) {
        if (pinTextField.text?.count)! > 5 {
            let user = AuthService.getSession()
            AuthService.signIn(email: (user?.email)!, password: pinTextField.text!,
                           onSuccess: {(authDataResult) -> () in
                                if authDataResult == nil {
                                    Alert.showAlert(title: "User error", message: "Se produjo un error durante el login", vc: self)
                                } else {
                                    //Alert.showAlert(title: "UID", message: authDataResult?.user.uid ?? "", vc: self)
                                    let storyboard = UIStoryboard(name: "home", bundle: nil)
                                    let controller = storyboard.instantiateViewController(withIdentifier: "home") as UIViewController
                                    self.present(controller, animated: true, completion: nil)
                                }
                            },
                           onError: { (error) -> () in
                                Alert.showErrorAlert(error: error, vc: self)
                            })
        } else {
            Alert.showAlert(title: "Error", message: "PIN incorrecte", vc: self)
        }
    }
    
    @IBAction func getTouchID(_ sender: UIButton) {
        TouchID.authenticationWithTouchID(
            onSuccess: { ()->() in
                let storyboard = UIStoryboard(name: "home", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "home") as UIViewController
                self.present(controller, animated: true, completion: nil)
        },
            onError: { (error, msgError) -> () in
                Alert.showAlert(title: "Error", message: msgError, vc: self)
        }
        )
    }
    
    @IBAction func doLogout(_ sender: UIButton) {
        if AuthService.doLogout() {
            performSegue(withIdentifier: "segueLogoutToLoginSignup", sender: nil)
        }
    }
}
