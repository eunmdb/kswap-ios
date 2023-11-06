import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            Text("Login")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size:24))
            Form{
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
                    Button("SIGN UP"){
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.235, green: 0.196, blue: 0.176))
                }
            }
            .scrollContentBackground(.hidden)

        }
    }
}

