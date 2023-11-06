import SwiftUI

struct LoggedOutPage: View {
    var body: some View {
        
        VStack (alignment: .leading, spacing: 16){
            Text("WELCOME!")
                .frame(maxWidth: .infinity)
                .padding()
                .bold()
                .font(.system(size: 24))
            NavigationView{
                VStack{
                    
                    NavigationLink(destination: SignUp()){
                        Text("Sign Up")
                            .bold()
                            .foregroundColor(Color(red: 0.235, green: 0.196, blue: 0.176))
                            .padding()
                            .background(Color(red: 0.733, green: 0.671, blue: 0.604))
                    }
                    Text("- OR -")
                        .frame(maxWidth: .infinity)
                        .padding()
                    NavigationLink(destination: Login()){
                        Text("Login")
                            .bold()
                            .foregroundColor(Color(red: 0.235, green: 0.196, blue: 0.176))
                            .padding()
                            .background(Color(red: 0.733, green: 0.671, blue: 0.604))
                    }
                }
            }
        }
    }
}


