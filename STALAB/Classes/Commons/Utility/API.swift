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
    var paramater: Alamofire.Parameters{ get }
    var headers: Alamofire.HTTPHeaders { get }

}

extension Request {
    var baseURL: String {
        "https://stalab.microcms.io/api/v1/"
    }
    var headers: Alamofire.HTTPHeaders {
        ["X-API-KEY" : ""]
    }
    var paramater: Alamofire.Parameters { [:] }
}

struct MenuRequest: Request {
    typealias Body = WrappedMenu
    var path: String { "" }
    var HTTPmethod: HTTPMethod { .get }
}

final class API {
    static var shared: API = .init()
    private init() {}

    func sendRequest<T: Request>(request: T, completion: @escaping (T.Body) -> Void?) {
        print(request.baseURL + request.path)
        AF.request(request.baseURL + request.path, method: request.HTTPmethod, headers: request.headers ).response { res in
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let data = res.data else { return }
                let result = try jsonDecoder.decode(T.Body.self, from: data)
                completion(result)
            }
            catch(let error) {
                print("エラー",error.localizedDescription)
            }
        }
    }
}
