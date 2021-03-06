//
//  Validator.swift
//  bnc10
//
//  Created by Ramón HC on 4/7/18.
//  Copyright © 2018 Ramón HC. All rights reserved.
//

import Foundation

class Validator {
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}
