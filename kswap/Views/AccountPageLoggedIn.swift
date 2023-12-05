import SwiftUI

struct AccountPageLoggedIn: View {
    private let constant_uid: Int = 680
    
    @State
    private var showPopUp = false
    
    @State
    private var colid: Int = -1 //used to keep track of the last item clicked
    
    @State
    private var uft: Bool = false
    
    @State
    private var collections : [collectionData] = []
    
    var body: some View {
        VStack{
            Spacer()
            Text("Welcome, CSC680!")
                .font(.system(size:24, weight: .black))
            Text("My Collections:")
                .font(.system(size:20, weight: .black))
            
            List{
                ForEach(collections) { usercollection in 
                    VStack{
                        Button(action: {
                            self.showPopUp = true
                            self.colid = usercollection.id
                            self.uft = usercollection.upfortrade
                        }){}
                        Image(usercollection.alt)
                            .resizable()
                            .aspectRatio(3/5,contentMode: .fit)
                            .frame(height:128)
                        Text("\(usercollection.collectiblename) Ver: \(usercollection.collectibleversion) - \(usercollection.stagename)")
                        if usercollection.upfortrade {
                            Text("Currently up for trade")
                        }
                    }
                    
                }
                
            }
            .alert("What would you like to do with this collectible?", isPresented: $showPopUp){
                Button("Delete", role:.destructive){
                    Task{
                        await deleteFromColl(colID: colid)
                        await showCollection()
                    }
                }
                Button(uft ? "Remove up for trade" : "Put up for trade"){
                    Task {
                        await updateStatus(status:!uft, colID:colid)
                        await showCollection()

                    }
                }
            }
            .task{
                await showCollection()
            }
        }

    }
    
    func showCollection() async {
        do{
            collections = try await DatabaseManager().getCollection()
//            print(collections)
        } catch {
            print("error")
        }
    }
    
    func deleteFromColl(colID: Int) async{
        do {
            try await DatabaseManager().deleteFromCol(colID: colID)
        } catch {
            print("error")
        }
    }
    
    func updateStatus(status: Bool, colID: Int) async {
        do {
            try await DatabaseManager().updateUFT(status: status, colID: colID)
        } catch {
            print("error")
        }
    }
   
}

