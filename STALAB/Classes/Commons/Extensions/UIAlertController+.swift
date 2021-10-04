//
//  UIAlertController+.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/10/04.
//

import Foundation
import UIKit

extension UIAlertController {

    func addOK(handler: ((UIAlertAction) -> Void)?) -> Self {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        self.addAction(okAction)
        return self
 }

    func addCancel(handler: ( (UIAlertAction) -> Void)?) -> Self {
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: handler)
        self.addAction(cancelAction)
        return self
    }

    func addAction(title: String, handler: ((UIAlertAction) -> Void)?) -> Self {
        let addAction = UIAlertAction(title: title, style: .default, handler: handler)
        self.addAction(addAction)
        return self
    }

    func show(from: UIViewController) {
        from.present(self, animated: true, completion: nil)
    }
}
