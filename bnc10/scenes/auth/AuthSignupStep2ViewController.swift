import UIKit

class AuthSignupStep2ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var conditionsSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Actions
    @IBAction func doRegistration(_ sender: UIButton) {
        if conditionsSwitch.isOn {
            let addressNotEmpty = (addressTextField.text?.count)! > 0
            let countryNotEmpty = (countryTextField.text?.count)! > 0
            if addressNotEmpty && countryNotEmpty {
                let user = AuthService.getSession()
                if user != nil {
                    DBUserService.setAddressCountry(uid: (user?.uid)!, address: addressTextField.text!, nationality: countryTextField.text!,                                                                                          onSuccess: {
                            self.performSegue(withIdentifier: "segueSignupStep2ToHome", sender: nil)
                        }, onError: { (error) -> () in
                            Alert.showErrorAlert(error: error, vc: self)
                        })
                } else {
                    Alert.showAlert(title: "Informació", message: "S'ha produït un error, prova més tard.", vc: self)
                }
            }
        } else {
            Alert.showAlert(title: "Condicions", message: "Has d'acceptar els termes i condicions d'ús.", vc: self)
        }
    }
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
