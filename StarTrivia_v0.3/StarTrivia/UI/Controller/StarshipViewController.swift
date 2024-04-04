import UIKit

class StarshipViewController: UIViewController, PersonProtocol, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet private (set) weak var name: UILabel!
    @IBOutlet private (set) weak var model: UILabel!
    @IBOutlet private (set) weak var length: UILabel!
    @IBOutlet private (set) weak var maker: UILabel!
    @IBOutlet private (set) weak var cost: UILabel!
    @IBOutlet private (set) weak var speed: UILabel!
    @IBOutlet private (set) weak var crew: UILabel!
    @IBOutlet private (set) weak var passengers: UILabel!
    @IBOutlet private (set) weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet private weak var previewLabel: FadeButtonAnimation!
    @IBOutlet private weak var nextButtonLabel: FadeButtonAnimation!
    
    
    var person: Person?
    private  let api = StarshipAPI()
    private var currentStarship = 0
    private var starshipsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFirstStarShip()
    }
    
    private func getFirstStarShip() {
        starshipsArray = person?.starshipUrls ?? []
        nextButtonLabel.isEnabled = starshipsArray.count > 1
        previewLabel.isEnabled = false
        
        guard let firstStarshipUrl = starshipsArray.first else {return}
        fetchStarshipFrom(firstStarshipUrl)
    }
    
    private func fetchStarshipFrom(_ url: String) {
        spinner.startAnimating()
        
        api.getStarship(url: url) { (result) in
            switch result {
            case .success(let starship):
                self.spinner.stopAnimating()
                let vm = VehicleViewModel(starship: starship)
                self.updateDetailsOf(vm)
                
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    private func updateDetailsOf(_ vm: VehicleViewModel) {
        name.text = vm.name
        model.text = vm.model
        length.text = vm.length
        maker.text = vm.maker
        cost.text = vm.cost
        speed.text = vm.speed
        crew.text = vm.speed
        passengers.text = vm.passenger
    }
    
    @IBAction private func previewButtonPressed(_ sender: Any) {
        currentStarship -= 1
        setupButtons()
    }
    
    @IBAction private func nextButtonPressed(_ sender: Any) {
        currentStarship += 1
        setupButtons()
    }
    
    private func setupButtons() {
        previewLabel.isEnabled = currentStarship == 0 ? false : true
        nextButtonLabel.isEnabled = currentStarship == starshipsArray.count - 1 ? false : true
        fetchStarshipFrom(starshipsArray[currentStarship])
    }
}
