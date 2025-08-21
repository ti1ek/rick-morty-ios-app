import SwiftUI

struct CharacterCardView: View {
    let character: Character
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
                    .frame(height: 150)
            }
            .cornerRadius(10)
            
            Text(character.name)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(1)
            
            HStack {
                Text(character.status)
                    .font(.caption)
                    .foregroundColor(statusColor)
                Text("•")
                Text(character.species)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 3)
    }
    
    var statusColor: Color {
        switch character.status.lowercased() {
        case "alive":
            return .green
        case "dead":
            return .red
        default:
            return .gray
        }
    }
}
