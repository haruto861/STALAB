//
//  ProfileViewController.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/10/09.
//

import UIKit
import Firebase
import GoogleSignIn

class ProfileViewController: UIViewController {

    @IBOutlet private weak var logoutButton: UIButton! {
        didSet {
            logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        }
    }

    @objc private func logout() {
        let firebaseAuth = Auth.auth()
        UIAlertController(title: "ログアウトしますか", message: "", preferredStyle: .alert).addCancel(handler: nil).addAction(title: "ログアウト") { _ in
            do {
                try firebaseAuth.signOut()
                Router.shared.restart()
            } catch(let error) {
                UIAlertController(title: "\(error.localizedDescription)", message: "ログアウトできませんでした", preferredStyle: .alert).addOK(handler: nil).show(from: self)
            }
        }
        .show(from: self)
    }
}
