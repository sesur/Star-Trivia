import Foundation
import Alamofire
import UIKit

enum MyResult<V> {
    case success(V)
    case failure(NewotworkingError)
}

func getGenericData<S: URLConvertible, T: Decodable>(url: S, completion: @escaping (MyResult<T>) -> Void) {
    AF.request(url)
        .validate(statusCode: 200..<300) // Optional: Validate the status code range
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let dataObject):
                completion(.success(dataObject))
            case .failure(let error):
                debugPrint(error.localizedDescription)
                if let statusCode = response.response?.statusCode {
                    switch statusCode {
                    case 400..<500:
                        completion(.failure(.invalidResponse))
                    case 500..<600:
                        completion(.failure(.invalidData))
                    default:
                        completion(.failure(.invalidJSON))
                    }
                } else {
                    completion(.failure(.invalidResponse))
                }
            }
        }
}

enum NewotworkingError: String, Error {
    case invalidResponse = "No Internet connection, turn on your wifi or data mobile"
    case invalidData = "The server do not return any data"
    case invalidJSON = "You have decoding problem, compare your model with JSON response request"
}

extension NewotworkingError: LocalizedError {
    var errorDescription: String? { return NSLocalizedString(rawValue, comment: "")}
}
