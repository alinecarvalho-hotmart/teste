//
//  Request.swift
//  TesteAline
//
//  Created by Aline Miranda Dutra de Carvalho on 22/08/21.
//

import Foundation

protocol EventRequestProvider {
    func getEvents(_ completion: @escaping (Bool, Events?, String?) -> ())
}

class EventRequest: EventRequestProvider {
    
    func getEvents(_ completion: @escaping (Bool, Events?, String?) -> ()) {
        Network().get(url: "https://5f5a8f24d44d640016169133.mockapi.io/api/events") { success, data in
            if success {
                do {
                    let eventData = try JSONDecoder().decode(Events.self, from: data!)
                    completion(true, eventData, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse Event to eventData")
                }
            } else {
                completion(false, nil, "Error: Employees GET Request failed")
            }
        }
    }
}
