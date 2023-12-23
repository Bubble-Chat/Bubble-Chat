import SwiftUI
import GoogleSignIn

@main
struct BubbleChatApp: App {
    var body: some Scene {
        WindowGroup {
            LogView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
