//
//  SignupMethodViewController.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/09/29.
//

import UIKit

final class SignupMethodViewController: UIViewController {

    @IBOutlet private weak var emailButton: UIButton! {
        didSet {
            emailButton.addTarget(self, action: #selector(emailPressed(_:)), for: .touchUpInside)
        }
    }
    @IBOutlet private weak var googleButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc private func emailPressed(_ sender: UIButton) {
        Router.shared.toSignup(from: self)
    }
}
