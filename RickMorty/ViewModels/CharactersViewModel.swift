import Foundation
import Combine

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var searchText = ""
    @Published var currentPage = 1
    @Published var totalPages = 1
    
    private var cancellables = Set<AnyCancellable>()
    private let networkService = NetworkService.shared
    
    init() {
        loadCharacters()
    }
    
    func loadCharacters() {
        isLoading = true
        networkService.fetchCharacters(page: currentPage, name: searchText)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    self.isLoading = false
                    if case .failure(let error) = completion {
                        print("Error: \(error)")
                    }
                },
                receiveValue: { response in
                    self.characters = response.results
                    self.totalPages = response.info.pages
                }
            )
            .store(in: &cancellables)
    }
    
    func search() {
        currentPage = 1
        loadCharacters()
    }
    
    func nextPage() {
        if currentPage < totalPages {
            currentPage += 1
            loadCharacters()
        }
    }
    
    func previousPage() {
        if currentPage > 1 {
            currentPage -= 1
            loadCharacters()
        }
    }
}
