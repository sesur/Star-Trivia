import Foundation
import Alamofire

class FilmAPI {
    func getFilm(url: String, competion: @escaping (MyResult<Film>) -> Void ) {
        getGenericData(url: url, completion: competion)
    }
}
