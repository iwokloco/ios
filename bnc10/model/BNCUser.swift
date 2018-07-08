import Foundation

class BNCUser {
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("user")
    
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
    
    init?(uid: String,
          email: String?,
          pinCode: String?,
          address: String?,
          birthDate: String?,
          fingerPrintEnabled: Bool?,
          genre: String?,
          hasAcceptedTermsAndConditions: Bool?,
          hasRequestedCard: Bool?,
          idNumber: String?,
          kycOk: Bool?,
          name: String?,
          surname: String?,
          nationality: String?,
          phone: String?,
          phoneVerified: Bool?,
          wantNotifications: Bool?) {
        
        self.uid = uid
        self.email = email ?? ""
        self.pinCode = pinCode ?? ""
        self.address = address ?? ""
        self.birthDate = birthDate ?? ""
        self.fingerPrintEnabled = fingerPrintEnabled ?? false
        self.genre = genre ?? ""
        self.hasAcceptedTermsAndConditions = hasAcceptedTermsAndConditions ?? false
        self.hasRequestedCard = hasRequestedCard ?? false
        self.idNumber = idNumber ?? ""
        self.kycOk = kycOk ?? false
        self.name = name ?? ""
        self.surname = surname ?? ""
        self.nationality = nationality ?? ""
        self.phone = phone ?? ""
        self.phoneVerified = phoneVerified ?? false
        self.wantNotifications = wantNotifications ?? true
    }
    
}
