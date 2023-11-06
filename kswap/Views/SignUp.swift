import SwiftUI

struct SignUp: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            Text("Sign Up")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size:24))
            Form{
                Section{
                    VStack{
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .textFieldStyle(.roundedBorder)
                    }
                } header: {
                    Text("Email:")
                }
                Section{
                    VStack{
                        TextField("Username", text: $username)
                            .autocapitalization(.none)
                            .textFieldStyle(.roundedBorder)
                    }
                } header: {
                    Text("Username:")
                }
                Section{
                    VStack{
                        SecureField("Password", text: $password)
                            .textFieldStyle(.roundedBorder)

                    }
                } header: {
                    Text("Password:")
                }
                Section{
                    VStack{
                        SecureField("Confirm Password", text: $confirmPassword)
                            .textFieldStyle(.roundedBorder)

                    }
                } header: {
                    Text("Confirm Password:")
                }
                Section{
                    Button("SIGN UP"){
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.235, green: 0.196, blue: 0.176))
                }

            }
        }
        .scrollContentBackground(.hidden)
    }
}


