import Foundation

struct User: Hashable {
  var name: String
  var avatar: String
  var isCurrentUser: Bool = false
}
