import Foundation
import Alamofire

class StarshipAPI {
    func getStarship(url: String, completion: @escaping (MyResult<Starship>) -> Void) {
        getGenericData(url: url, completion: completion)
    }
}
