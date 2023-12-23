import SwiftUI
import OpenTDS

struct MainView: View {
    var body: some View {
        TossTabView {
            FriendView()
                .tossTabItem("친구", Image(systemName: "person"))
            ChatView()
                .tossTabItem("채팅", Image(systemName: "bubble.right"))
            SettingView()
                .tossTabItem("설정", Image(systemName: "gearshape.fill"))
        }
    }
}

#Preview {
    MainView()
}
