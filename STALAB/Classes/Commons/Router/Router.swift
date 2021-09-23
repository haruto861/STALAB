//
//  Router.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/09/23.
//

import Foundation
import UIKit

class Router {
    static var shared: Router = .init()
    private init() {}

    private var window: UIWindow?

    func showRoot(window: UIWindow?) {
        let vc = UIStoryboard.signupViewController
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        self.window = window
    }
}
