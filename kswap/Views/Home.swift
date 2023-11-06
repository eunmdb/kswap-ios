import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            HomeBanner()
            Text("Recently Added:")
                .bold()
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Rectangle()
                .fill(.white) //temporary will delete later
        }
        
    }
}
