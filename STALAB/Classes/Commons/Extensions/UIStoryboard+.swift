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

    static var topPageViewController: TopPageViewController {
        return UIStoryboard(name: "TopPage", bundle: nil).instantiateInitialViewController() as! TopPageViewController
    }

    static var homeViewController: HomeViewController {
        return UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
    }

    static var profileViewController: ProfileViewController {
        return UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController() as! ProfileViewController
    }
}
