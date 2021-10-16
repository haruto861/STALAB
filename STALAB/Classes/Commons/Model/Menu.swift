//
//  Menu.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/10/13.
//

import Foundation

struct WrappedMenu: Codable {
    let contents: [Menu]
}

struct Menu: Codable {
    let name: String
    let size: String
    let calorie: String

    enum CodingKeys : String, CodingKey {
        case name = "name"
        case size = "size"
        case calorie = "calorie"
    }
}
