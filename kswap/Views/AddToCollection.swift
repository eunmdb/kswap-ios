import SwiftUI

struct AddToCollection: View {
    @State
    private var showPopUp = false
    
    @State
    private var addedToCollection = false;
    
    let selected_collectible: searchResults
    
    private let user_id: Int = 680
    
    var body: some View {
        ScrollView {
            VStack{
                Text("\(selected_collectible.groupname) - \(selected_collectible.stagename)")
                Image(selected_collectible.alt)
                    .resizable()
                    .aspectRatio(3/5, contentMode: .fit)
                    .frame(height:512)

                Text("\(selected_collectible.collectiblename) Ver: \(selected_collectible.collectibleversion)")
                Button("Add to collection"){
                    self.showPopUp = true
                    Task {
                        do{
                            let coll_amount = try await DatabaseManager().checkCollection(collection_id: selected_collectible.id)
//                            print(coll_amount)
                            if(coll_amount == 0){
                                self.addedToCollection = true
                                try await DatabaseManager().insertCollectible(user_id: user_id, collection_id:selected_collectible.id)
                            }else {
                                self.addedToCollection = false
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
                .alert(isPresented: $showPopUp){
                    if self.addedToCollection {
                        return Alert(title: Text("Collectible has been added to my collection!"))
                    }else {
                        return Alert(title: Text("Collectible is already in my collection!"))
                    }
                }
                .padding()
                .foregroundColor(Color(red: 197/255, green: 197/255, blue:197/255))
                .background(Color(red: 52/255, green: 62/255, blue: 65/255))
            }
            .padding()
        }
    }
}

