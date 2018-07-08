import UIKit

class AuthSignupDNIFrontViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    // MARK: Actions
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doRegistration(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueSignupDNIToStep2", sender: nil)
    }
}
