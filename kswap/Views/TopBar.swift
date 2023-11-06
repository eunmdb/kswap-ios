import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack{
            Text("KSWAP").foregroundColor(Color(red: 197/255, green: 197/255, blue:197/255))
                .bold()
                .font(.system(size: 32))
                .tracking(3)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 52/255, green: 62/255, blue: 65/255))
        }
    }
}
