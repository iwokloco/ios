import UIKit

class Alert {
    static func showAlert(title: String, message: String, vc: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func showErrorAlert(error: Error, vc: UIViewController) {
        showAlert(title: "Error", message: error.localizedDescription, vc: vc)
    }
    
}
