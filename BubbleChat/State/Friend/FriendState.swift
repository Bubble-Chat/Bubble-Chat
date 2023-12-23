import Foundation
import Alamofire

class FriendState: ObservableObject {
    @Published var emailsearch: String = ""
    
    @Published var email: String = ""
    @Published var friendemail: String = ""
    
    func addfriend() {
        
    }
    
    func friendsearch() {
        let query : Parameters = [
            "friendEmail" : emailsearch
        ]
        
        AF.request("https://36ad-221-168-22-204.ngrok-free.app/api/v1/friend/relate",
                   method: .post,
                   parameters: query,
                   encoding: JSONEncoding.default)
        { $0.timeoutInterval = 60 }
            .validate()
            .responseDecodable(of: Friend.self) { response in
                switch response.result {
                case .success(let value):
                    self.email = value.email
                    self.friendemail = value.friendEmail
                case .failure(let error):
                    print(error)
                }
            }
    }
}

struct Friend: Decodable {
    let email, friendEmail: String
}
