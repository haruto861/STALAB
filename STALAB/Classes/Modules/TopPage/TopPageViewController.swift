//
//  TopPageViewController.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/09/25.
//

import UIKit
import Firebase
import GoogleSignIn

final class TopPageViewController: UIViewController {

    @IBOutlet private weak var signupButton: UIButton! {
        didSet {
            signupButton.addTarget(self, action: #selector(didTapSingup), for: .touchUpInside)
        }
    }
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        }
    }


    @objc private func didTapSingup() {
        Router.shared.toSignup(from: self)
    }
    @objc private func didTapSignIn() {
        do  {
            try Auth.auth().signOut()
        }
        catch(let error) {
            print("エラー",error)
        }
        print("ログアウトしました")
    }
}
