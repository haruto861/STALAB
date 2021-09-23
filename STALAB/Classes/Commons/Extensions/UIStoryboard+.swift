//
//  UIStoryboard+.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/09/23.
//

import Foundation
import UIKit

extension UIStoryboard {
    static var signupViewController: SignupViewController {
        return UIStoryboard(name: "Signup", bundle: nil).instantiateInitialViewController() as! SignupViewController
    }
}
