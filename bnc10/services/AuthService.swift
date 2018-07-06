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
    
    static func signIn(email: String, password: String,
                       onSuccess: @escaping (_ authDataResult: AuthDataResult?)->(),
                       onError: @escaping (_ error: Error)->()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                onError(error!)
                return
            }
            guard let user = user else {
                onSuccess(nil)
                return
            }
            onSuccess(user)
        }
    }
    
    static func doLogout() -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            return false
        }
    }
    
    static func getSession() -> User? {
        guard let user = Auth.auth().currentUser else {
            return nil
        }
        return user
    }
}
