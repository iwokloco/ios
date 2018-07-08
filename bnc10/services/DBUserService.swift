import Foundation
import Firebase

class DBUserService {
  
    static func setNameSurnameEmailPincode(uid: String, name: String, surname: String, email: String, pinCode: String,
                               onSuccess: @escaping ()->(), onError: @escaping (_ error: Error)->()) {
        let db = Database.database().reference()
        db.child("users").child(uid).updateChildValues(["name": name, "surname": surname, "email": email, "pinCode": pinCode]) { (error, ref) -> Void in
            if error == nil {
                onSuccess()
            } else {
                onError(error!)
            }
        }
    }
    
    static func setFingerPrintEnabled(uid: String, fingerPrintEnabled: Bool,
                                      onSuccess: @escaping ()->(), onError: @escaping (_ error: Error)->()) {
        let db = Database.database().reference()
        db.child("users").child(uid).updateChildValues(["fingerPrintEnabled": fingerPrintEnabled]) { (error, ref) -> Void in
            if error == nil {
                onSuccess()
            } else {
                onError(error!)
            }
        }
    }
    
    static func setAddressCountry(uid: String, address: String, nationality: String,
                                  onSuccess: @escaping ()->(), onError: @escaping (_ error: Error)->()) {
        let db = Database.database().reference()
        db.child("users").child(uid).updateChildValues(["address": address, "nationality": nationality]) { (error, ref) -> Void in
            if error == nil {
                onSuccess()
            } else {
                onError(error!)
            }
        }
    }
    
    static func setEmailPinCode(uid: String, email: String, pinCode: String,
                               onSuccess: @escaping ()->(), onError: @escaping (_ error: Error)->()) {
        let db = Database.database().reference()
        db.child("users").child(uid).updateChildValues(["email": email, "pinCode": pinCode]) { (error, ref) -> Void in
            if error == nil {
                onSuccess()
            } else {
                onError(error!)
            }
        }
    }
    
    static func getUser(uid: String) -> BNCUser? {
        let db = Database.database().reference()
        var bncUser: BNCUser? = nil
        db.child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            bncUser = BNCUser(uid: uid,
                           email: value?["email"] as? String ?? "",
                           pinCode: value?["pinCode"] as? String ?? "",
                           address: value?["address"] as? String ?? "",
                           birthDate: value?["birthDate"] as? String ?? "",
                           fingerPrintEnabled: value?["fingerPrintEnabled"] as? Bool ?? false,
                           genre: value?["genre"] as? String ?? "",
                           hasAcceptedTermsAndConditions: value?["hasAcceptedTermsAndConditions"] as? Bool ?? false,
                           hasRequestedCard: value?["hasRequestedCard"] as? Bool ?? false,
                           idNumber: value?["idNumber"] as? String ?? "",
                           kycOk: value?["kycOk"] as? Bool ?? false,
                           name: value?["name"] as? String ?? "",
                           surname: value?["surname"] as? String ?? "",
                           nationality: value?["nationality"] as? String ?? "",
                           phone: value?["phone"] as? String ?? "",
                           phoneVerified: value?["phoneVerified"] as? Bool ?? false,
                           wantNotifications: value?["wantNotifications"] as? Bool ?? true)!
        })
        return bncUser
    }
}



