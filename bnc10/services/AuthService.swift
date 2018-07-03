import Foundation
import FirebaseAuth

class AuthService {
    static func createUser(email: String, password: String, onSuccess: @escaping ()->(), onError: @escaping (_ error: Error)->()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                onSuccess()
            } else {
                onError(error!)
            }
        }
    }
}
