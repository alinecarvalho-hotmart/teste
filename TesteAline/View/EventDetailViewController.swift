//
//  EventDetailViewController.swift
//  TesteAline
//
//  Created by Aline Miranda Dutra de Carvalho on 22/08/21.
//

import UIKit

class EventDetailViewController: UIViewController {

    var viewModel = EventViewModel()
    var userViewModel = UserViewModel()
    
    var name: String = ""
    var date: Int = 0
    var price: Double = 0.0
    var desc: String = ""
    var id: String = ""

    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventPrice: UILabel!
    @IBOutlet weak var eventDescription: UITextView!
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var checkinButton: UIButton!
    @IBOutlet weak var success: UILabel!
    
    @IBAction func sendUserInfo(_ sender: Any) {
        userInfo()
    }
    
    @IBAction func checkIn(_ sender: Any) {
        nameTextField?.isHidden = false
        emailTextField?.isHidden = false
        checkinButton.isHidden = false

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventDetail()
        setView()

    }
    
    private func setView(){
        nameTextField?.isHidden = true
        emailTextField?.isHidden = true
        checkinButton.isHidden = true
        success.isHidden = true
    }
    
    
    private func eventDetail() {
        eventTitle.text = name
        eventDate.text = String(date)
        eventPrice.text = String(price)
        eventDescription.text = desc
    }
    
    private func userInfo() {
        guard let nameText = nameTextField?.text else { return }
        guard let emailText = emailTextField?.text else { return }
        
        let userData = UserViewData(
            eventId: id,
            name: nameText,
            email: emailText
        )
        
        userViewModel.execute(user: userData) { success in
            if success {
                DispatchQueue.main.async {
                    self.nameTextField?.isHidden = true
                    self.emailTextField?.isHidden = true
                    self.checkinButton.isHidden = true
                    self.success.isHidden = false
                }
            }
        }
    }

}
