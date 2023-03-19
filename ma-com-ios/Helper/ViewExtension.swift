import SwiftUI

extension View {
  func endEditing(_ force: Bool) {
    UIApplication.shared.windows.forEach { $0.endEditing(force)}
  }
}
