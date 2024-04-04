import Foundation

struct Vehicle: Codable {
    let name: String
    let model: String
    let length: String
    let manufacturer: String
    let cost: String
    let speed: String
    let crew: String
    let passengers: String
    
    enum CodingKeys: String, CodingKey{
        case name
        case model
        case length
        case manufacturer
        case cost = "cost_in_credits"
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
    }
}
