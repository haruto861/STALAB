//
//  MenuViewController.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/10/14.
//

import UIKit

final class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = MenuRequest()
        API.shared.getMenu(request: request) { res in
            print(res.contents)
        }
    }
}
