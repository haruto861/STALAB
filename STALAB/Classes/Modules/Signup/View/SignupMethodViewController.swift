//
//  SignupMethodViewController.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/09/29.
//

import UIKit
import GoogleSignIn
import Firebase

final class SignupMethodViewController: UIViewController {

    @IBOutlet private weak var emailButton: UIButton! {
        didSet {
            emailButton.addTarget(self, action: #selector(emailPressed(_:)), for: .touchUpInside)
        }
    }
    @IBOutlet private weak var googleButton: UIButton! {
        didSet {
            googleButton.addTarget(self, action: #selector(googlePressed(_:)), for: .touchUpInside)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc private func emailPressed(_ sender: UIButton) {
        Router.shared.toSignup(from: self)
    }

    @objc private func googlePressed(_ sender: UIButton) {
        guard let clientId = FirebaseApp.app()?.options.clientID else {
            return
        }
        let config = GIDConfiguration(clientID: clientId)

        // sign in flow
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            if let error = error {
                print("エラー",error.localizedDescription)
            } else {
                guard
                    let authetication = user?.authentication,
                    let idToken = authetication.idToken
                else {
                    return
                }
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authetication.accessToken)
                linkAccount(authenticatonCredential: credential)
            }
        }
    }

    private func linkAccount(authenticatonCredential: AuthCredential) {
        Auth.auth().signIn(with: authenticatonCredential) { data, error in
            if let error  = error {
                print("エラー",error)
                return
            } else {
                Router.shared.toHome(from: self)
            }
        }
    }

}
