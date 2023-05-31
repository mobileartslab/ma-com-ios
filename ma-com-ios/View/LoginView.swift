import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct LoginView: View {
  @State var username: String = ""
  @State var usernameError: String = ""
  @State var password: String = ""
  @State var passwordError: String = ""
  @State var submitError: String = ""
  
  var body: some View {
    NavigationView {
      VStack {
        WelcomeText()
        UserImage()
        
        TextField("Username", text: $username)
          .padding()
          .background(lightGreyColor)
          .cornerRadius(5.0)
          .padding(.bottom, 10)
          .textInputAutocapitalization(.never)
        
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
        }.padding(.bottom, 20).frame(maxWidth: .infinity, alignment: .leading)
        
        SecureField("Password", text: $password)
          .padding()
          .background(lightGreyColor)
          .cornerRadius(5.0)
          .padding(.bottom, 10)
        
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
        }.padding(.bottom, 20).frame(maxWidth: .infinity, alignment: .leading)
        
        /// NavigationLink(destination: ChatView()) {
          Button(action: handleSubmit) {
            LoginButtonContent()
          }
        ///}
        ///
        HStack {
          Text( submitError )
            .fontWeight(.light)
            .font(.footnote)
            .foregroundColor(Color.red)
          
          if !submitError.isEmpty  {
            Image( systemName: "exclamationmark.triangle")
             .foregroundColor(Color.red)
             .font(.footnote)
          }
        }.padding(.top, 20)
        
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
    let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
    let evalResult = emailPredicate.evaluate(with: username)
    usernameError = ""
    passwordError = ""
    var isValid = true
    
    if username.isEmpty {
      usernameError = "Username required"
      isValid = false
    }
    else if evalResult == false {
      usernameError = "Invalid email"
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
