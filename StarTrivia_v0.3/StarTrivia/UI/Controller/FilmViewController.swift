import UIKit

class FilmViewController: UIViewController, PersonProtocol, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet private (set) weak var previewFilm: FadeButtonAnimation!
    @IBOutlet private (set) weak var nextFilm: FadeButtonAnimation!
    @IBOutlet private (set) weak var released: UILabel!
    @IBOutlet private (set) weak var producer: UILabel!
    @IBOutlet private (set) weak var director: UILabel!
    @IBOutlet private (set) weak var episode: UILabel!
    @IBOutlet private (set) weak var filmTitle: UILabel!
    @IBOutlet private (set) weak var crowl: UITextView!
    @IBOutlet private (set) weak var spinner: UIActivityIndicatorView!
    
    var person: Person?
    
    private let api = FilmAPI()
    private var filmsArray = [String]()
    private var currentFilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmsArray = person?.filmUrls ?? []
        nextFilm.isEnabled = filmsArray.count > 1
        previewFilm.isEnabled = false
        
        spinner.startAnimating()
        guard let firstFilm = filmsArray.first else {return}
        fetchFilmsFrom(url: firstFilm)
        
    }
    
    private func fetchFilmsFrom(url: String){
        spinner.startAnimating()
        api.getFilm(url: url) { (result) in
            switch result {
            case .success(let film):
                self.spinner.stopAnimating()
                let vm = FilmViewModel(film)
                self.updateDetailsFor(vm)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    private func updateDetailsFor(_ vm: FilmViewModel){
        filmTitle.text = vm.title
        producer.text = vm.producer
        director.text = vm.producer
        episode.text = vm.episode
        released.text = vm.releaseDate
        crowl.text = vm.crawl
    }
    
    @IBAction private func pressPreviewButton(_ sender: Any) {
        currentFilm -= 1
        setupButtons()
    }
    
    @IBAction private func pressNextButton(_ sender: Any) {
        currentFilm += 1
        setupButtons()
    }
    
    private func setupButtons() {
        nextFilm.isEnabled = currentFilm == filmsArray.count - 1 ? false : true
        previewFilm.isEnabled = currentFilm == 0 ? false: true
        fetchFilmsFrom(url: filmsArray[currentFilm])
    }
}

struct FilmViewModel {
    let title: String
    let episode: String
    let crawl: String
    let producer:String
    let director: String
    let releaseDate: String
}

extension FilmViewModel {
    init(_ film: Film){
        title = film.title
        producer = film.producer
        director = film.producer
        episode = String(film.episode)
        releaseDate = film.releaseDate
        crawl = film.crawl
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "\r", with: "")
    }
}
