import SwiftUI

struct CharacterDetailView: View {
    let characterId: Int
    @StateObject private var viewModel = CharacterDetailViewModel()
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let character = viewModel.character {
                VStack(alignment: .leading, spacing: 20) {
                    // Character Image
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                            .frame(height: 300)
                    }
                    .cornerRadius(20)
                    .padding(.horizontal)
                    
                    // Character Info
                    VStack(alignment: .leading, spacing: 10) {
                        Text(character.name)
                            .font(.largeTitle)
                            .bold()
                        
                        InfoRow(label: "Status", value: character.status)
                        InfoRow(label: "Species", value: character.species)
                        InfoRow(label: "Gender", value: character.gender)
                        InfoRow(label: "Origin", value: character.origin.name)
                        InfoRow(label: "Location", value: character.location.name)
                        
                        if !character.type.isEmpty {
                            InfoRow(label: "Type", value: character.type)
                        }
                        
                        Text("Episodes: \(character.episode.count)")
                            .font(.headline)
                            .padding(.top)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadCharacter(id: characterId)
        }
    }
}

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(label):")
                .font(.headline)
                .foregroundColor(.secondary)
            Text(value)
                .font(.body)
        }
    }
}
