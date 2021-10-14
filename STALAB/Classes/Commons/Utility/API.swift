//
//  API.swift
//  STALAB
//
//  Created by 松島悠人 on 2021/10/13.
//

import Foundation
import UIKit
import Alamofire

protocol Request {
    // どの構造体を適用するか
    associatedtype Body: Codable
    // baseURLは固定だからextensionで実装する→リソースの所在地
    var baseURL: String { get }
    // 実行したい内容
    var HTTPmethod: Alamofire.HTTPMethod { get }
    // 欲しい内容
    var paramater: [String:Any] { get }
    // ヘッダーに含める内容 key: value
    var header: [String : String] { get }
}

class API {

    static var shared: API = .init()
    private init() {}

    //menuを取得するAPI
    func getMenu(completion: @escaping (Menu) -> Void) {
        AF.request("https://stalab.microcms.io/api/v1/stalabmenu281046861", method: .get, headers:[ "X-API-KEY" : "b5fc82a4-a500-48bf-8e43-adff446197cb" ]).responseJSON { res in
            print(res)
        }
    }
}
