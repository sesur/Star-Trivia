//
//  VehicleViewController.swift
//  Star Trivia
//
//  Created by Sergiu on 3/15/19.
//  Copyright © 2019 Sergiu. All rights reserved.
//

import UIKit

class VehicleViewController: UIViewController, PersonProtocol, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var person: Person?
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var model: UILabel!
    @IBOutlet private weak var length: UILabel!
    @IBOutlet private weak var maker: UILabel!
    @IBOutlet private weak var cost: UILabel!
    @IBOutlet private weak var speed: UILabel!
    @IBOutlet private weak var crew: UILabel!
    @IBOutlet private weak var passenger: UILabel!
    @IBOutlet private weak var previewButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!
    
    private let api = VehicleAPI()
    private var vehiclesArray = [String]()
    private var currentVehicle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNextAndPreviewButtons()
    }
    
    private func vehicleUrls() -> [String]  {
        return person?.vehicleUrls ?? []
    }
    
    private func setupNextAndPreviewButtons() {
        vehiclesArray = vehicleUrls()
        nextButton.isEnabled = vehiclesArray.count > 1
        previewButton.isEnabled = false
        
        guard let firstVehicleUrl = vehiclesArray.first else {return}
        fetchVehicle(from: firstVehicleUrl)
    }
    
    private func fetchVehicle(from url: String ) {
        spinner.startAnimating()
        api.getVehicle(url: url) { (result) in
            switch result {
            case .success(let vehicle):
                self.spinner.stopAnimating()
                let vm = VehicleViewModel(vehicle: vehicle)
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
        crew.text  = vm.crew
        passenger.text = vm.passenger
    }
    
    @IBAction private func pressPreviewButton(_ sender: Any) {
        currentVehicle -= 1
        updatePreviewAndNextButton()
    }
    
    @IBAction private func pressNextButton(_ sender: Any) {
        currentVehicle += 1
        updatePreviewAndNextButton()
    }
    
    private func updatePreviewAndNextButton() {
        nextButton.isEnabled = currentVehicle == vehiclesArray.count - 1 ? false : true
        previewButton.isEnabled = currentVehicle == 0 ? false : true
        fetchVehicle(from: vehiclesArray[currentVehicle])
    }
}

struct VehicleViewModel {
    let name: String
    let model: String
    let length: String
    let maker: String
    let cost: String
    let speed: String
    let crew: String
    let passenger: String
}

extension VehicleViewModel {
    init(vehicle: Vehicle) {
        name = vehicle.name
        model = vehicle.model
        length = vehicle.length
        maker = vehicle.manufacturer
        cost = vehicle.cost
        speed = vehicle.speed
        crew  = vehicle.crew
        passenger = vehicle.passengers
    }
}

extension VehicleViewModel {
    init(starship: Starship ) {
        name = starship.name
        model = starship.model
        length = starship.length
        maker = starship.maker
        cost = starship.cost
        speed = starship.speed
        crew  = starship.crew
        passenger = starship.passengers
    }
}
