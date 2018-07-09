import UIKit
import Firebase

class LoadViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        if AuthService.getSession() != nil {
            self.performSegue(withIdentifier: "segueLoggedValidateSession", sender: nil)
        } else {
            self.performSegue(withIdentifier: "noLoggedOnboarding", sender: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
