import UIKit

class AuthSignupStep1ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var buttonImageBack: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var pinTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var buttonRegistration: UIButton!
    
    var name: String = ""
    var surname: String = ""
    
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
        /*textFieldName.placeholder = NSLocalizedString("auth-login-signup-step1-field-name", comment: "")
        textFieldName.attributedPlaceholder = NSAttributedString(string: "placeholder text",
                                                               attributes: [NSAttributedStringKey.foregroundColor: Colors.darkBlue])*/
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
        let validEmail = Validator.isValidEmail(email: (emailTextField?.text)!)
        let pinLength = (pinTextField.text?.count)! > 5
        if validEmail && pinLength {
            AuthService.createUser(email: emailTextField.text!, password: pinTextField.text!,
               onSuccess: {() -> () in
                    let user = AuthService.getSession()
                    if user != nil {
                        self.extractNameSurnameFromTextField()
                        DBUserService.setNameSurnameEmailPincode(uid: user!.uid, name: self.name, surname: self.surname, email: (user?.email)!, pinCode: self.pinTextField.text!,
                             onSuccess: {
                                if TouchID.isEnabled() {
                                    DispatchQueue.main.async() { () -> Void in
                                        self.performSegue(withIdentifier: "segueSignupToTouchID", sender: nil)
                                    }
                                } else {
                                    DispatchQueue.main.async() { () -> Void in
                                        self.performSegue(withIdentifier: "segueSignupToDNI", sender: nil)
                                    }
                                    DBUserService.setFingerPrintEnabled(uid: user!.uid, fingerPrintEnabled: false, onSuccess: {}, onError: { (error) -> () in
                                        Alert.showErrorAlert(error: error, vc: self)
                                    })
                                }
                            }, onError: { (error) -> () in
                                Alert.showErrorAlert(error: error, vc: self)
                            })
                    } else {
                        Alert.showAlert(title: "Informació", message: "S'ha produït un error, prova més tard.", vc: self)
                    }
                },
               onError: { (error) -> () in
                    let alertController = UIAlertController(title: "Ops!", message: error.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            )
        } else {
            if !validEmail {
                Alert.showAlert(title: "Ops!", message: "Introdueix un email vàlid.", vc: self)
            } else if !pinLength {
                Alert.showAlert(title: "Ops!", message: "El PIN ha de ser de 6 dígits.", vc: self)
            }
        }
    }
    
    @IBAction func gotoBack(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Private methods
    private func extractNameSurnameFromTextField() {
        let nameSurnameArray = nameTextField.text!.split{$0 == " "}.map(String.init)
        self.name = nameSurnameArray[0]
        if nameSurnameArray.count > 1 {
            for i in 1..<nameSurnameArray.count {
                self.surname += nameSurnameArray[i]
            }
        }
    }
}
