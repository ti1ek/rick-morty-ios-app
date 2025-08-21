import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    TextField("Search characters...", text: $viewModel.searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onSubmit {
                            viewModel.search()
                        }
                    
                    Button("Search") {
                        viewModel.search()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                
                // Characters List
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(viewModel.characters) { character in
                                NavigationLink(destination: CharacterDetailView(characterId: character.id)) {
                                    CharacterCardView(character: character)
                                }
                            }
                        }
                        .padding()
                    }
                }
                
                // Pagination
                HStack {
                    Button("Previous") {
                        viewModel.previousPage()
                    }
                    .disabled(viewModel.currentPage == 1)
                    
                    Text("Page \(viewModel.currentPage) of \(viewModel.totalPages)")
                        .padding(.horizontal)
                    
                    Button("Next") {
                        viewModel.nextPage()
                    }
                    .disabled(viewModel.currentPage == viewModel.totalPages)
                }
                .padding()
            }
            .navigationTitle("Rick and Morty")
        }
    }
}
