//
//  EventDetailViewController.swift
//  TesteAline
//
//  Created by Aline Miranda Dutra de Carvalho on 22/08/21.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    
    var viewModel = EventViewModel()

    
    @IBOutlet weak var eventDate: UILabel?
    @IBOutlet weak var eventTitle: UILabel?
    @IBOutlet weak var eventDescription: UILabel?
    @IBOutlet weak var eventPrice: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventID("1")
        

    }
    
    func eventID(_ id: String) {
        viewModel.getDetail(id: id) { [weak self] event in
            DispatchQueue.main.async {
                self?.eventTitle?.text = event.title
                self?.eventDate?.text = String(event.date)
                self?.eventPrice?.text = String(event.price)
                self?.eventDescription?.text = event.description
            }
        }
    }

}
