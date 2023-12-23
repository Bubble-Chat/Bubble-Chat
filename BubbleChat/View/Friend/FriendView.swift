import SwiftUI

struct FriendView: View {
    @ObservedObject var state = FriendState()
    var body: some View {
        VStack {
            HStack {
                Text("친구")
                    .font(.title2)
                Spacer()
            }
            
            TextField("", text: $state.emailsearch)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .keyboardType(.emailAddress)
                .multilineTextAlignment(.leading)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(lineWidth: 0.3)
                )
                .onSubmit {
                    state.friendsearch()
                }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    MainView()
}
