import SwiftUI

struct ChatView: View {
  @State var typingMessage: String = ""
  var chatHelper = ChatHelper()
  @ObservedObject private var keyboard = KeyboardResponder()
    
  init() {
    UITableView.appearance().separatorStyle = .none
    UITableView.appearance().tableFooterView = UIView()
  }
    
  var body: some View {
      VStack {
        List {
          ForEach(chatHelper.realTimeMessages, id: \.self) { msg in
            MessageView(currentMessage: msg)
          }
        }
        HStack {
          TextField("Message...", text: $typingMessage)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(minHeight: CGFloat(30))
          Button(action: sendMessage) {
            Text("Send")
          }
        }.frame(minHeight: CGFloat(50)).padding()
      }.navigationBarTitle(Text(DataSource.firstUser.name), displayMode: .inline)
        .padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
  }
    
  func sendMessage() {
    chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.secondUser))
    typingMessage = ""
  }
}

struct ChatView_Previews: PreviewProvider {
  static var previews: some View {
    ChatView()
  }
}
