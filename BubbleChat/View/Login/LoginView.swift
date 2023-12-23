import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LogView: View {
    @ObservedObject var state = LoginState()
    
    
    func handleSignInButton() {
        var rootViewController: UIViewController {
            if let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let root = screen.windows.first?.rootViewController {
                return root
            } else {
                return .init()
            }
        }
        
        GIDSignIn.sharedInstance.signIn(
            withPresenting: rootViewController) { signInResult, error in
                guard let result = signInResult else { return }
                let user = signInResult?.user
                let emailAddress = user?.profile?.email
                let fullName = user?.profile?.name
                state.nameRead = fullName ?? ""
                state.emailRead = emailAddress ?? ""
            }
    }
    
    var body: some View {
        VStack {
            Text("로그인")
                .padding()
                .font(.largeTitle)
            Spacer()
            GoogleSignInButton {
                handleSignInButton()
                state.login()
            }
            .padding()
        }
    }
}

#Preview {
    LogView()
}
