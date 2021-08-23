//
//  UserViewModel.swift
//  TesteAline
//
//  Created by Aline Miranda Dutra de Carvalho on 23/08/21.
//

import Foundation

struct UserViewData {
    var eventId: String
    var name: String
    var email: String
}

class UserViewModel: NSObject {
    
    let userRequest: UserRequestProvider
    
    init(userRequest: UserRequestProvider = UserRequest()) {
        self.userRequest = userRequest
    }
    
    func execute(user: UserViewData, _ completion: @escaping (Bool) -> ()) {
        userRequest.postUser(userViewData(user: user)) { success in
            if success {
                completion(true)
            }
        }
    }
    
    private func userViewData(user: UserViewData) -> User {
        let userData = User(
            eventId: user.eventId,
            name: user.name,
            email: user.email
            )
        
        return userData
    }
}
