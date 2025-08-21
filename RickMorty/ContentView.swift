import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Characters", systemImage: "person.3")
                }
            
            EpisodesView()
                .tabItem {
                    Label("Episodes", systemImage: "tv")
                }
            
            LocationsView()
                .tabItem {
                    Label("Locations", systemImage: "map")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
