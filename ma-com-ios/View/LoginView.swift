import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct LoginView: View {
  @State var username: String = ""
  @State var usernameError: String = ""
  @State var password: String = ""
  @State var passwordError: String = ""
  
  var body: some View {
    NavigationView {
      VStack {
        WelcomeText()
        UserImage()
        
        TextField("Username", text: $username)
          .padding()
          .background(lightGreyColor)
          .cornerRadius(5.0)
          .padding(.bottom, 20)
        
        HStack {
          Text( usernameError )
            .fontWeight(.light)
            .font(.footnote)
            .foregroundColor(Color.red)
          
          if !usernameError.isEmpty  {
            Image( systemName: "exclamationmark.triangle")
             .foregroundColor(Color.red)
             .font(.footnote)
          }
        }
        
        SecureField("Password", text: $password)
          .padding()
          .background(lightGreyColor)
          .cornerRadius(5.0)
          .padding(.bottom, 20)
        
        HStack {
          Text( passwordError )
            .fontWeight(.light)
            .font(.footnote)
            .foregroundColor(Color.red)
          
          if !passwordError.isEmpty  {
            Image( systemName: "exclamationmark.triangle")
             .foregroundColor(Color.red)
             .font(.footnote)
          }
        }
        
        /// NavigationLink(destination: ChatView()) {
          Button(action: handleSubmit) {
            LoginButtonContent()
          }
        ///}
      }
      .padding()
    }
  }
  
  func handleSubmit() {
    if (!validate()) {
      
    }
    print("Button tapped by Nick")
    
  }
  
  
  func validate() -> Bool {
    usernameError = ""
    passwordError = ""
    var isValid = true
    
    if username.isEmpty {
      usernameError = "Username required"
      isValid = false
    }
    if password.isEmpty {
      passwordError = "Password required"
      isValid = false
    }
    return isValid
  }
}


struct WelcomeText : View {
  var body: some View {
    return Text("Communicator")
      .font(.largeTitle)
      .fontWeight(.semibold)
      .padding(.bottom, 20)
    }
}


struct UserImage : View {
  var body: some View {
    return Image("appLogo")
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: 150, height: 150)
      .padding(.bottom, 75)
  }
}


struct LoginButtonContent : View {
  var body: some View {
    return Text("LOGIN")
      .font(.headline)
      .foregroundColor(.white)
      .padding()
      .frame(width: 220, height: 60)
      .background(Color.green)
      .cornerRadius(15.0)
  }
}


#if DEBUG
struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
#endif
