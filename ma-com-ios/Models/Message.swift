import Foundation

struct Message: Hashable {
  var content: String
  var user: User
}

struct DataSource {
  static let firstUser = User(name: "Jack White", avatar: "jack")
  static var secondUser = User(name: "Nick Sophinos", avatar: "volkslaufe", isCurrentUser: true)
  static let messages = [
      Message(content: "The big three killed my baby, No money in my hand again", user: DataSource.firstUser),
      Message(content: "Ah, icky thump, who'da thunk? Sittin' drunk on a wagon to Mexico", user: DataSource.secondUser),
      Message(content: "The big three killed my baby, Nobody's comin' home again", user: DataSource.firstUser),
      Message(content: "Why don't you take the day off and try to repair? A billion others don't seem to care Better ideas are stuck in the mud", user: DataSource.firstUser),
      Message(content: "Left alone, I hit myself with a stone Went home and learned how to clean up after myself", user: DataSource.secondUser),
      Message(content: "And my baby's my common sense So don't feed me planned obsolescence", user: DataSource.firstUser)
  ]
}
