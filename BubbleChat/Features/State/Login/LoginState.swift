import Alamofire
import Foundation

class LoginState: ObservableObject {
    @Published var emailRead: String = ""
    @Published var nameRead: String = ""
    
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var accessToken: String = ""
    @Published var exists: Bool = false
    
    
    func login() {
        let query : Parameters = [
            "name" : emailRead,
            "mail" : nameRead
        ]
        
        AF.request("http://34aa-221-168-22-204.ngrok-free.app/api/v1/user/signin",
                   method: .post,
                   parameters: query,
                   encoding: JSONEncoding.default)
        { $0.timeoutInterval = 60 }
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any],
                       let email = json["name"] as? String,
                       let friendemail = json["email"] as? String,
                       let accessToken = json["accessToken"] as? String{
                        self.name = email
                        self.email = friendemail
                        self.accessToken = accessToken
                    }
                    print("Response: \(value)")
                case .failure(let error):
                    print(error)
                }
            }
    }
}


