//
//  ForgetPasswordViewController.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/10/13.
//

import UIKit
import Firebase

final class ForgetPasswordViewController: UIViewController {

    @IBOutlet private weak var sendEmailButton: UIButton! {
        didSet {
            sendEmailButton.addTarget(self, action: #selector(sendEmailButtonPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet private weak var emailTextField: UITextField! {
        didSet {
            emailTextField.delegate = self
        }
    }

    @objc private func sendEmailButtonPressed() {
        guard let email = emailTextField.text else { return }
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                UIAlertController.init(title: "エラー", message: "\(error.localizedDescription)", preferredStyle: .alert).addOK(handler: nil).show(from: self)
            } else {
                UIAlertController.init(title: "パスワード再設定メールを送信しました", message: "", preferredStyle: .alert).addOK(handler: nil).addAction(title: "") { _ in
                    Router.shared.toLogin(from: self)
                }.show(from: self)
            }
        }
    }
}

extension ForgetPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

