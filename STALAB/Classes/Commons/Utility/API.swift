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
    associatedtype Body: Codable
    var baseURL: String { get }
    var path: String { get }
    var HTTPmethod: Alamofire.HTTPMethod { get }
    var paramater: [String:Any] { get }
    var headers: Alamofire.HTTPHeaders { get }

}

extension Request {
    var baseURL: String {
        "https://stalab.microcms.io/api/v1/"
    }
    var headers: Alamofire.HTTPHeaders {
        ["X-API-KEY" : "b5fc82a4-a500-48bf-8e43-adff446197cb"]
    }
    var paramater: [String:Any] { [:] }
}

struct MenuRequest: Request {
    typealias Body = WrappedMenu
    var path: String { "stalab281046861" }
    var HTTPmethod: HTTPMethod { .get }
}

final class API {

    static var shared: API = .init()
    private init() {}

    func getMenu(completion: @escaping (WrappedMenu) -> Void) {
        AF.request("https://stalab.microcms.io/api/v1/stalabmenu281046861", method: .get, headers: ["X-API-KEY" : "b5fc82a4-a500-48bf-8e43-adff446197cb" ]).response { res in
            do {
                guard let data = res.data else { return }
                let menu = try JSONDecoder().decode(WrappedMenu.self, from: data)
                completion(menu)
            }
            catch(let error) {
                print("エラー",error.localizedDescription)
            }
        }
    }
}
