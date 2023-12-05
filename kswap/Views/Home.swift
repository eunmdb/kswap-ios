import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            HomeBanner()
                Text("Artists Available:")
                    .bold()
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                HStack{
                    VStack{
                        Image("bts")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("BTS")
                    }
                    VStack{
                        Image("twice")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("TWICE")
                    }
                    
                }
                Spacer()
            
        }
        
    }
}
