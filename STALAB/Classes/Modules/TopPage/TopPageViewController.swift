//
//  TopPageViewController.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/09/25.
//

import UIKit

final class TopPageViewController: UIViewController {

    @IBOutlet private weak var signupButton: UIButton! {
        didSet {
            signupButton.addTarget(self, action: #selector(didTapSingup), for: .touchUpInside)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc private func didTapSingup() {
        Router.shared.toSignup(from: self)
    }
}
