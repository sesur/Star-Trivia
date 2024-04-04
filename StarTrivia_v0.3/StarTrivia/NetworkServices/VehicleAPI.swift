import Foundation
import Alamofire

class VehicleAPI {
    func getVehicle(url: String, completion: @escaping (MyResult<Vehicle>) -> Void) {
        getGenericData(url: url, completion: completion)
    }
}
