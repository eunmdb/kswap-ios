import SwiftUI

struct HomeBanner: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(red:0.733, green: 0.671, blue:0.604))
            VStack{
                Text("Keep track of your collection!")
                    .font(.system(size: 20))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Update your collection to easily find out which photocards you're currently missing")
                
            }
            
        }
      
        
    }
    
}


