//
//  EventViewModel.swift
//  TesteAline
//
//  Created by Aline Miranda Dutra de Carvalho on 22/08/21.
//

import Foundation
import UIKit

struct EventViewData {
    var people: [People]
    var date: Int
    var description: String
    var image: String
    var longitude: Double
    var latitude: Double
    var price: Double
    var title: String
    var id: String
    var cupons: [String]?
}

class EventViewModel: NSObject {
    
    var eventRequest: EventRequestProvider
    var eventList = [EventViewData]()

    init(
        eventRequest: EventRequestProvider = EventRequest()
    ){
        self.eventRequest = eventRequest
    }
    
    func execute(view: UITableView?) {
        eventRequest.getEvents { success, eventData, error in
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
    
    private func fetchdata(events: Events) {
        for event in events {
            eventList.append(eventListModel(event: event))
        }
    }
    
    private func eventListModel(event: Event) -> EventViewData {
        let eventData = EventViewData(
            people: event.people,
            date: event.date,
            description: event.description,
            image: event.image,
            longitude: event.longitude,
            latitude: event.latitude,
            price: event.price,
            title: event.title,
            id: event.id,
            cupons: event.cupons
        )
        
        
        return eventData
    }
}
