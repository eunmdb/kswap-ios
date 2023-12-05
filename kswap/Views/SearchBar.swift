import SwiftUI




struct SearchBar: View {
    @State private var searchText: String = ""
    var results : [searchResults] = []

    var body: some View {
        
        HStack{
            
            TextField("Search", text: $searchText)
//                .onSubmit{
//                    Task{
//                        await showSearchResults()
//
//                    }
//
//                }
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 24, height: 24)
        }
        .padding()
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 0.5)
        )

    }
    
//    func showSearchResults() async {
//
//        do{
//            results = try await DatabaseManager().searchCollectible(searchterm: searchText)
//            print(results)
//        } catch {
//            print("error")
//        }
//    }
}


