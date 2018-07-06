import Foundation
import Firebase

class DBUserService {
  
    static func getUserByUID(uid: String) {//}-> DataSnapshot {
        let db = Database.database().reference()
        db.child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                //return snapshot
        })
    }
    
}
    //

/*databaseRef = Database.database().reference()
 let user = Auth.auth().currentUser
 let userID = user?.uid
 Alert.showAlert(title: "UID", message: userID!, vc: self)
 print(userID!)
 databaseRef?.child("users").child(userID!).setValue(["email": user?.email])
 databaseRef?.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
 // Get user value
 let value = snapshot.value as? NSDictionary
 let name = value?["email"] as? String ?? ""
 
 print(name)
 // let user = User(username: username)
 
 // ...
 }) { (error) in
 print(error.localizedDescription)
 }
}*/



