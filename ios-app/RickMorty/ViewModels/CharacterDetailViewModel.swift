import Foundation
import Combine

class CharacterDetailViewModel: ObservableObject {
    @Published var character: Character?
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    private let networkService = NetworkService.shared
    
    func loadCharacter(id: Int) {
        isLoading = true
        networkService.fetchCharacterById(id: id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    self.isLoading = false
                },
                receiveValue: { character in
                    self.character = character
                }
            )
            .store(in: &cancellables)
    }
}
