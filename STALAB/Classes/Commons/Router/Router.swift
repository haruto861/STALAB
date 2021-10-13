//
//  Router.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/09/23.
//

import Foundation
import UIKit

final class Router {
    static var shared: Router = .init()
    private init() {}

    private var window: UIWindow?

    func showRoot(window: UIWindow?) {
        let vc = UIStoryboard.topPageViewController
        let nav  = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        self.window = window
    }

    func showHome() {
        let tab = UITabBarController()
        let vc = [UIStoryboard.homeViewController, UIStoryboard.profileViewController]
        tab.setViewControllers(vc, animated: true)
        window?.rootViewController = tab
        window?.makeKeyAndVisible()
    }

    func toSignup(from: UIViewController) {
        let vc = UIStoryboard.signupViewController
        transit(from: from, next: vc)
    }

    func toHome(from: UIViewController) {
        let tab = UITabBarController()
        let vc = [UIStoryboard.homeViewController, UIStoryboard.profileViewController]
        tab.setViewControllers(vc, animated: true)
        window?.rootViewController = tab
        window?.makeKeyAndVisible()
    }

    func toLogin(from: UIViewController) {
        let vc = UIStoryboard.loginViewController
        transit(from: from, next: vc)
    }

    func toForgetPassword(from: UIViewController) {
        let vc = UIStoryboard.forgetPasswordViewController
        transit(from: from, next: vc)
    }

    func restart() {
        showRoot(window: window)
    }

    func transit(from: UIViewController, next: UIViewController, animated: Bool = true) {
        if let nav = from.navigationController {
            nav.pushViewController(next, animated: true)
        } else {
            from.present(next, animated: true, completion: nil)
        }
    }
}
