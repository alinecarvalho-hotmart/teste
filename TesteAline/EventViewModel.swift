//
//  EventViewModel.swift
//  TesteAline
//
//  Created by Aline Miranda Dutra de Carvalho on 22/08/21.
//

import Foundation
import UIKit

struct EventViewData {
    var people: [People] = []
    var date: Int = 55
    var description: String = "teste"
    var image: String = ""
    var longitude: Double = 0.0
    var latitude: Double = 0.0
    var price: Double = 55.3
    var title: String = "teste"
    var id: String = "1"
    var cupons: [String]? = []
}

class EventViewModel: NSObject {
    
    var eventRequest: RequestProvider
    var eventList = [EventViewData]()

    init(
        eventRequest: RequestProvider = Request()
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
    
    func getDetail(id: String, completion: @escaping (EventViewData) -> ()){
        eventRequest.getEvent(id: id) { success, event, error in
            if success, let event = event {
                let eventDetail = self.eventListModel(event: event)
                completion(eventDetail)
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
            cupons: event.cupons)
        
        
        return eventData
    }
}
