import SwiftUI

struct LocationsView: View {
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.locations) { location in
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.headline)
                    Text(location.type)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(location.dimension)
                        .font(.caption)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Locations")
            .onAppear {
                viewModel.loadLocations()
            }
        }
    }
}

class LocationsViewModel: ObservableObject {
    @Published var locations: [LocationModel] = []
    private var cancellables = Set<AnyCancellable>()
    private let networkService = NetworkService.shared
    
    func loadLocations() {
        networkService.fetchLocations()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Error: \(error)")
                    }
                },
                receiveValue: { response in
                    self.locations = response.results
                }
            )
            .store(in: &cancellables)
    }
}
