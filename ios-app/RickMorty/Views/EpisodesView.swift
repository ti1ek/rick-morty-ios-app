import SwiftUI

struct EpisodesView: View {
    @StateObject private var viewModel = EpisodesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.episodes) { episode in
                VStack(alignment: .leading) {
                    Text(episode.name)
                        .font(.headline)
                    Text(episode.episode)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(episode.air_date)
                        .font(.caption)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Episodes")
            .onAppear {
                viewModel.loadEpisodes()
            }
        }
    }
}

class EpisodesViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    private var cancellables = Set<AnyCancellable>()
    private let networkService = NetworkService.shared
    
    func loadEpisodes() {
        networkService.fetchEpisodes()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Error: \(error)")
                    }
                },
                receiveValue: { response in
                    self.episodes = response.results
                }
            )
            .store(in: &cancellables)
    }
}
