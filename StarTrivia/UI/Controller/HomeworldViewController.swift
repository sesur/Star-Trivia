import UIKit

class HomeworldViewController: UIViewController, PersonProtocol, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet private (set) weak var name: UILabel!
    @IBOutlet private (set) weak var climate: UILabel!
    @IBOutlet private (set) weak var terrain: UILabel!
    @IBOutlet private (set) weak var population: UILabel!
    @IBOutlet private (set) weak var spinner: UIActivityIndicatorView!
    
    var person: Person?
    private let api = HomeworldAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        fetchHomeWorldPerson()
    }
    
    private func fetchHomeWorldPerson() {
        guard let url = person?.homeWorld else {return}
        api.getHomeworldPerson(url: url) { (result) in
            switch result {
            case .success(let homeworld):
                self.spinner.stopAnimating()
                let vm = HomeworldViewModel(homeworld)
                self.updateDetailsOf(vm)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    private func updateDetailsOf(_ person: HomeworldViewModel) {
        name.text = person.name
        climate.text = person.climate
        terrain.text = person.terrain
        population.text = person.population
    }
}

struct HomeworldViewModel {
    let name: String
    let climate: String
    let terrain: String
    let population: String
}

extension HomeworldViewModel {
    init(_ homeworld: HomeworldPerson) {
         name = homeworld.name
         climate = homeworld.climate
         terrain = homeworld.terrain
         population = homeworld.population
     }
}
