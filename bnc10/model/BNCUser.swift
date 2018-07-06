import Foundation

class BNCUser : NSObject {
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("user")
    
    //MARK: Properties
    var uid: String
    var email: String
    var pinCode: String?
    var address: String?
    var birthDate: String?
    var fingerPrintEnabled: Bool?
    var genre: String?
    var hasAcceptedTermsAndConditions: Bool?
    var hasRequestedCard: Bool?
    var idNumber: String?
    var kycOk: Bool?
    var name: String?
    var surname: String?
    var nationality: String?
    var phone: String?
    var phoneVerified: Bool?
    var wantNotifications: Bool?
    
    //MARK: Types
    struct PropertyKey {
        static let uid = "uid"
        static let address = "address"
        static let birthDate = "birthDate"
        static let email = "email"
        static let fingerPrintEnabled = "fingerPrintEnabled"
        static let genre = "genre"
        static let hasAcceptedTermsAndConditions = "hasAcceptedTermsAndConditions"
        static let hasRequestedCard = "hasRequestedCard"
        static let idNumber = "idNumber"
        static let kycOk = "kycOk"
        static let name = "name"
        static let surname = "surname"
        static let nationality = "nationality"
        static let phone = "phone"
        static let phoneVerified = "phoneVerified"
        static let pinCode = "pinCode"
        static let wantNotifications = "wantNotifications"
    }
    
    init?(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(uid: "11111", email: "iwokloco@gmail.com")
    }
}
