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
                self.setFingerPrintEnabledToDB(enabled: true)
            },
            onError: { (error, msgError) -> () in
                Alert.showAlert(title: "Error", message: msgError, vc: self)
            }
        )
    }
    
    @IBAction func gotoBack(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func skipThisStep(_ sender: UIButton) {
        self.setFingerPrintEnabledToDB(enabled: false)
        /*let user = AuthService.getSession()
        if user != nil {
            DBUserService.setFingerPrintEnabled(uid: user!.uid, fingerPrintEnabled: false, onSuccess: {
                self.performSegue(withIdentifier: "segueSignupTouchIDToDNI", sender: nil)
            }, onError: { (error) -> () in
                Alert.showErrorAlert(error: error, vc: self)
            })
        } else {
            Alert.showAlert(title: "Informació", message: "S'ha produït un error, prova més tard.", vc: self)
        }*/
    }
    
    private func setFingerPrintEnabledToDB(enabled: Bool) {
        let user = AuthService.getSession()
        if user != nil {
            DBUserService.setFingerPrintEnabled(uid: user!.uid, fingerPrintEnabled: enabled, onSuccess: {
                self.performSegue(withIdentifier: "segueSignupTouchIDToDNI", sender: nil)
            }, onError: { (error) -> () in
                Alert.showErrorAlert(error: error, vc: self)
            })
        } else {
            Alert.showAlert(title: "Informació", message: "S'ha produït un error, prova més tard.", vc: self)
        }
    }
}
