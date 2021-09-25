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

    func toSignup(from: UIViewController) {
        let vc = UIStoryboard.signupViewController
        transit(from: from, next: vc)
    }

    func transit(from: UIViewController, next: UIViewController, animated: Bool = true) {
        if let nav = from.navigationController {
            nav.pushViewController(next, animated: true)
        } else {
            from.present(next, animated: true, completion: nil)
        }
    }
}
