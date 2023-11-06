
import SwiftUI

struct NavBar: View {
    var body: some View {
        HStack{
            TabView{
                Home()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                    }
                SearchPage()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                LoggedOutPage()
                    .tabItem{
                        Image(systemName: "person")
                        Text("Account")
                    }
            }
            
            
        }
    }
}

