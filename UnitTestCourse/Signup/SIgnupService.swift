struct Response {
    let status: String
}

protocol SignupServiceProtocol {
    func signup(
        firstname: String,
        lastname: String,
        email: String,
        password: String,
        completion: (Response) -> Void
    )
}

class SignupService: SignupServiceProtocol {
    func signup(
        firstname: String,
        lastname: String,
        email: String,
        password: String,
        completion: (Response) -> Void
    ) {
        
        completion(Response(status: "Successful"))
    }
}
