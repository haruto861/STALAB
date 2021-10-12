//
//  TopPageViewController.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/09/25.
//

import UIKit
import Firebase

final class TopPageViewController: UIViewController {

    @IBOutlet private weak var signupButton: UIButton! {
        didSet {
            signupButton.addTarget(self, action: #selector(didTapSingup), for: .touchUpInside)
        }
    }

    @IBOutlet private weak var loginButton: UIButton! {
        didSet {
            loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        }
    }

    @IBOutlet weak var anonymousLoginButton: UIButton! {
        didSet {
            anonymousLoginButton.addTarget(self, action: #selector(didTapAnoymousLogin), for: .touchUpInside)
        }
    }

    @objc private func didTapSingup() {
        Router.shared.toSignup(from: self)
    }

    @objc private func didTapLogin() {
        Router.shared.toLogin(from: self)
    }

    @objc private func didTapAnoymousLogin() {
        Auth.auth().signInAnonymously { result, error in
            if let error = error {
                UIAlertController.init(title: "エラー", message: "\(error.localizedDescription)", preferredStyle: .alert).addOK(handler: nil).show(from: self)
            } else {
                Router.shared.toHome(from: self)
            }
        }
    }
}
