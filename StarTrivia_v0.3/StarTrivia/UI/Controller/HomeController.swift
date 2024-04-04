import UIKit

protocol PersonProtocol {
    var person: Person? { get set }
}

class HomeController: UIViewController, PersonProtocol, Storyboarded {
    @IBOutlet private (set) weak var name: UILabel!
    @IBOutlet private (set) weak var height: UILabel!
    @IBOutlet private (set) weak var mass: UILabel!
    @IBOutlet private (set) weak var hair: UILabel!
    @IBOutlet private (set) weak var birthYear: UILabel!
    @IBOutlet private (set) weak var gender: UILabel!
    @IBOutlet private (set) weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet private (set) weak var homeWorldButton: UIButton!
    @IBOutlet private (set) weak var vehiclesButton: UIButton!
    @IBOutlet private (set) weak var starshipsButton: UIButton!
    @IBOutlet private (set) weak var filmsButton: UIButton!
    @IBOutlet private (set) weak var randomButton: BlackBackgroundButton!
    
    private var personAPI = PersonAPI()
    var person: Person?
    weak var coordinator: MainCoordinator?
    
    var navigateHome: ((Person?) -> Void)?
    var navigateToVehicle: ((Person?) -> Void)?
    var navigateToStarship: ((Person?) -> Void)?
    var navigateToFilms: ((Person?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomPerson()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    @IBAction func pressRandomButton(_ sender: UIButton) {
        generateRandomPerson()
    }
    
    private func startSpinning() {
        spinner.startAnimating()
    }
    
    private func stopSpinning() {
        self.spinner.stopAnimating()
    }
    
    private func generateRandomPerson() {
        startSpinning()
        personAPI.parseRandom(url: getRandomNumber()) { (result) in
            switch result {
            case .success(let person):
                self.stopSpinning()
                
                self.person = person
                let vm = HomeViewModel(person: person)
                self.updateFields(vm)
                self.updateButtons(vm)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    private func getRandomNumber() -> String {
        return String(Int.random(in: 1 ... 87))
    }
    
    private func updateFields(_ vm: HomeViewModel) {
        name.text = vm.name
        height.text = vm.height
        mass.text  = vm.mass
        hair.text = vm.hair
        birthYear.text = vm.birthYear
        gender.text = vm.gender
    }
    
    private func updateButtons(_ vm: HomeViewModel) {
        homeWorldButton.isEnabled = !vm.homeWorld.isEmpty
        starshipsButton.isEnabled = !vm.starshipUrls.isEmpty
        vehiclesButton.isEnabled = !vm.vehicleUrls.isEmpty
        filmsButton.isEnabled = !vm.filmUrls.isEmpty
        
        [homeWorldButton, starshipsButton, vehiclesButton, filmsButton].forEach {
            self.transformAffine($0)
        }
    }
    
    private func transformAffine(_ button: UIButton?) {
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseInOut, animations: {
            button?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            button?.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    @IBAction private func pressHomeWorldButton(_ sender: Any) {
        navigateHome?(person)
    }
    @IBAction private func pressVehicleButton(_ sender: Any) {
        navigateToVehicle?(person)
    }
    @IBAction private func pressStarshipButton(_ sender: Any) {
        navigateToStarship?(person)
    }
    @IBAction private func pressFilmsButton(_ sender: Any) {
        navigateToFilms?(person)
    }
}

struct HomeViewModel {
    let name: String
    let height: String
    let mass: String
    let hair: String
    let birthYear: String
    let gender: String
    let homeWorld: String
    let filmUrls: [String]
    let vehicleUrls: [String]
    let starshipUrls: [String]
}

extension HomeViewModel {
    init(person: Person) {
        name = person.name
        height = person.height
        mass  = person.mass
        hair = person.hair
        birthYear = person.birthYear
        gender = person.gender
        homeWorld = person.homeWorld
        filmUrls = person.filmUrls
        vehicleUrls = person.vehicleUrls
        starshipUrls = person.starshipUrls
    }
}
