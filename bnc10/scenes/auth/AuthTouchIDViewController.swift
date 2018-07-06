import UIKit
import LocalAuthentication

class AuthTouchIDViewController: UIViewController {

    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: Colors.darkBlue, colorTwo: Colors.lightBlue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func validateTouchID(_ sender: UITapGestureRecognizer) {
        TouchID.authenticationWithTouchID(
            onSuccess: { ()->() in
                Alert.showAlert(title: "SUCCESS", message: "logrado", vc: self)
            },
            onError: { (error, msgError) -> () in
                Alert.showAlert(title: "Error", message: msgError, vc: self)
            }
        )
    }
    
    @IBAction func gotoBack(_ sender: UITapGestureRecognizer) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func gotoNext() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "authSignupDNIFrontViewController") as? AuthSignupDNIFrontViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
}
