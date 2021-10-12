//
//  LoginViewController.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/10/12.
//

import UIKit
import Firebase

final class LoginViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField! {
        didSet {
            emailTextField.delegate = self
        }
    }

    @IBOutlet private weak var passwordTextField: UITextField! {
        didSet {
            emailTextField.delegate = self
        }
    }

    @IBOutlet private weak var loginButton: UIButton! {
        didSet {
            loginButton.addTarget(self, action: #selector(loginPressed(_:)), for: .touchUpInside)
        }
    }

    @objc private func loginPressed(_ sender: UIButton) {
        enableLoginButton()
    }

    private func enableLoginButton() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty
        else {
            return
        }
        login(email: email, password: password)
    }

    private func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                switch AuthErrorCode(rawValue: error._code) {
                case .userNotFound:
                    UIAlertController(title: "エラー", message: "ユーザーが見つかりません", preferredStyle: .alert).addCancel(handler: nil).addAction(title: "会員登録へ") { _ in
                        Router.shared.toSignup(from: self)
                    }.show(from: self)
                case .networkError:
                    UIAlertController.init(title: "ネットワークエラー", message: "電波のよりところで\n再度お試しください", preferredStyle: .alert).addOK(handler: nil).show(from: self)
                case .invalidEmail:
                    UIAlertController.init(title: "エラー", message: "メールアドレスの形式が違います", preferredStyle: .alert).addOK(handler: nil).show(from: self)
                case .wrongPassword:
                    UIAlertController(title: "エラー", message: "パスワードが違います", preferredStyle: .alert).addOK(handler: nil).show(from: self)
                default:
                    break
                }
            } else {
                Router.shared.toHome(from: self)
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
