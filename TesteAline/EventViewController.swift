//
//  ViewController.swift
//  TesteAline
//
//  Created by Aline Miranda Dutra de Carvalho on 22/08/21.
//

import UIKit

class EventViewController: UIViewController, UITableViewDelegate {


    @IBOutlet weak var eventTableView: UITableView!
    
    var viewModel = EventViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTableView.delegate = self
        eventTableView.dataSource = self
        creatListEvent()
    }
    
    func creatListEvent() {
        viewModel.execute(view: eventTableView)
    }
   
}

extension EventViewController: UITabBarDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        
        let eventItem = viewModel.eventList[indexPath.row]
        cell.textLabel?.text = eventItem.title
        
        return cell
    }
    
    
}
