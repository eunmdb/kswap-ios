import SwiftUI

struct SearchPage: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            SearchBar()
            Text("Search Results:")
            Spacer()
        }
        .padding()
    }
}

