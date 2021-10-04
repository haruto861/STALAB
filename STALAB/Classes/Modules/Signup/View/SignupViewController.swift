//
//  SignupViewController.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/09/23.
//

import UIKit
import Firebase


final class SignupViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField! {
        didSet {
            userNameTextField.delegate = self
        }
    }
    @IBOutlet private weak var emailTextFiled: UITextField! {
        didSet {
            emailTextFiled.delegate = self
        }
    }
    @IBOutlet private weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.delegate = self
        }
    }
    @IBOutlet private weak var confirmPasswordTextfField: UITextField! {
        didSet {
            confirmPasswordTextfField.delegate = self
        }
    }

    @IBOutlet private weak var signupButton: UIButton! {
        didSet {
            signupButton.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)
        }
    }

    @objc private func didTapSignup() {
        guard
            let userName = userNameTextField.text ,
            let email = emailTextFiled.text,
            let password = passwordTextField.text,
            let confirm = confirmPasswordTextfField.text else {
            return
        }

        if password != confirm {
            return
        }
        creatUser(email: email, password: password, userName: userName)
    }

    private func creatUser(email: String, password: String, userName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                switch AuthErrorCode(rawValue: error._code) {
                case .invalidEmail:
                    UIAlertController(title: "エラー", message: "メールアドレスの形式が違います", preferredStyle: .alert).addOK(handler: nil).show(from: self)
                case .emailAlreadyInUse:
                    UIAlertController(title: "エラー", message: "このメールアドレスは既に使用されています", preferredStyle: .alert).addCancel(handler: nil).addAction(title: "ログインへ") { _ in
                        Router.shared.toHome(from: self)
                    }.show(from: self)
                case .weakPassword:
                    UIAlertController(title: "エラー", message: "パスワードは6文字以上で入植してください", preferredStyle: .alert).addOK(handler: nil).show(from: self)
                default:
                    break
                }
            } else {
                Router.shared.toHome(from: self)
            }
            guard let uid = Auth.auth().currentUser?.uid else { return }
            Firestore.firestore().collection("users").document(uid).setData(["createdAt": Timestamp(),
                                                                             "userName": userName,
                                                                             "email": email
            ]) { error in
                if let error = error {
                    print("Firestoreへの保存に失敗しました",error.localizedDescription)
                    return
                }
            }
        }
    }
}

extension SignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
