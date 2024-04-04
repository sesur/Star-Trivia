import Foundation
import Alamofire

class HomeworldAPI {
    func getHomeworldPerson(url: String, completion: @escaping (MyResult<HomeworldPerson>) -> Void) {
        getGenericData(url: url, completion: completion)
    }
}
