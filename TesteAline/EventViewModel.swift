//
//  EventViewModel.swift
//  TesteAline
//
//  Created by Aline Miranda Dutra de Carvalho on 22/08/21.
//

import Foundation
import UIKit

struct EventViewData {
    let people: [People]
    let date: Int
    let description: String
    let image: String
    let longitude: Double
    let latitude: Double
    let price: String
    let title: String
    let id: String
    let cupons: [String]?
}

class EventViewModel: NSObject {
    
    var eventRequest: RequestProvider
    var eventList = [EventViewData]()
    var events = Events()

    init(eventRequest: RequestProvider = Request()){
        self.eventRequest = eventRequest
    }
    
    func execute(view: UITableView?) {
        eventRequest.getEvent { success, eventData, error in
            if success, let event = eventData {
                self.fetchdata(events: event)
                DispatchQueue.main.async {
                    view?.reloadData()
                }
            } else {
                print(error ?? "")
            }
        }
    }
    
    func fetchdata(events: Events) {
        self.events = events
        let eventListData = [EventViewData]()
        for event in events {
            eventList.append(eventListModel(event: event))
        }
        
        eventList = eventListData
    }
    
    func eventListModel(event: Event) -> EventViewData {
        let people = event.people
        let date = event.date
        let description = event.description
        let image = event.image
        let longitude = event.longitude
        let latitude = event.latitude
        let price = String(event.price)
        let title = event.title
        let id = event.id
        let cupons = event.cupons
        
        return EventViewData(people: people, date: date, description: description, image: image, longitude: longitude, latitude: latitude, price: price, title: title, id: id, cupons: cupons)
    }
}
