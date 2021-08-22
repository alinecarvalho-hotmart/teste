//
//  EventModel.swift
//  TesteAline
//
//  Created by Aline Miranda Dutra de Carvalho on 22/08/21.
//

import Foundation

typealias Events = [Event]

struct Event: Codable {
    let people: [People]
    let date: Int
    let description: String
    let image: String
    let longitude: Double
    let latitude: Double
    let price: Double
    let title: String
    let id: String
    let cupons: [String]?
    
}

struct People: Codable {
    let id: String
    let eventId: String
    let name: String
    let picture: String
}
