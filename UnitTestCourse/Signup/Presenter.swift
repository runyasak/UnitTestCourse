class Presenter {
    var service: SignupServiceProtocol

    init(service: SignupServiceProtocol) {
        self.service = service
    }

    func isValid(firstname: String) -> Bool {
        return !firstname.isEmpty
    }
    
    func isValid(password: String, secondPassword: String) -> Bool {
        guard !password.isEmpty, !secondPassword.isEmpty else {
            return false
        }

        return password == secondPassword
    }
    
    func signup(
        firstname: String,
        lastname: String,
        email: String,
        password: String,
        completion: ((String) -> Void)? = nil
    ) {
        guard isValid(firstname: firstname) else {
            return
        }
        
        service.signup(firstname: firstname, lastname: lastname, email: email, password: password) {
            (response) in
                guard let safeCompletion = completion else {
                    return
                }

                return safeCompletion(response.status)
        }
    }
}
