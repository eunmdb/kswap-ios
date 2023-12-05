import SwiftUI

struct SearchPage: View {
    @State
    private var searchText: String = ""
    
    @State
    private var results : [searchResults] = []
    
    private var filteredResults: [searchResults] {
        guard !searchText.isEmpty else {
            return results
        }
        
        let filtered: [searchResults] = results.filter {
            $0.stagename.localizedStandardContains(searchText) || $0.groupname.localizedStandardContains(searchText) ||
            $0.collectiblename.localizedStandardContains(searchText)
        }
        
        return filtered
    }

    var body: some View {
        NavigationStack{
            List{
                if !filteredResults.isEmpty{
                    ForEach(filteredResults) { result in
                        VStack{
                            let alt = result.alt
                            Image(alt)
                                .resizable()
                                .aspectRatio(3/5, contentMode: .fit)
                                .frame(height:128)
                            Text("\(result.collectiblename) Ver: \(result.collectibleversion) - \(result.stagename)")
                            
                            VStack(spacing:0){
                                NavigationLink("",destination: AddToCollection(selected_collectible: result))
                                    .opacity(0)
                            }
                        }
                    }
                } else {
                    Text("No results found.")
                }
            }
            .task{
                await showSearchResults()
            }
        }
    
        .searchable(text: $searchText, prompt: "Search")
    }
    
    
    func showSearchResults() async {
        do{
            results = try await DatabaseManager().searchCollectible()
//            print(results)
        } catch {
            print("error")
        }
    }
    
}

