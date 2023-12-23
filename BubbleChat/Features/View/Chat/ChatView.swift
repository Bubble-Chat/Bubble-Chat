import SwiftUI

struct ChatView: View {
    
    @ObservedObject var state = ChatState()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                TextField("", text: $state.chatstr)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onSubmit {
                        
                    }
                    .padding()
                
                Button(action:{
                    
                }) {
                    Image(systemName: "paperplane")
                        .padding()
                        .foregroundColor(Color.black)
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ChatView()
}
