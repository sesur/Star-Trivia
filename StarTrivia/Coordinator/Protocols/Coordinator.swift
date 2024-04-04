import UIKit

protocol Coordinator: AnyObject{
    var coordinatorChild: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
