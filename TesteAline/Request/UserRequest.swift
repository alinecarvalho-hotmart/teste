//
//  UserRequest.swift
//  TesteAline
//
//  Created by Aline Miranda Dutra de Carvalho on 23/08/21.
//

import Foundation

protocol UserRequestProvider {
    func postUser(_ user: User, _ completion: @escaping (Bool) -> ())
}


class UserRequest: UserRequestProvider {
    
    func postUser(_ user: User, _ completion: @escaping (Bool) -> ()) {
        guard let url = URL(string: "https://5f5a8f24d44d640016169133.mockapi.io/api/checkin") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(user)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                completion(true)
            }
        }.resume()
    }
    
    
    
    
}

