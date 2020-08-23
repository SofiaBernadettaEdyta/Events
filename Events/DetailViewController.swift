//
//  DetailViewController.swift
//  Events
//
//  Created by Zofia Drabek on 09/02/2020.
//  Copyright © 2020 Zofia Drabek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var eventsManager: EventsManager!
    var index: Int!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = eventsManager.getEvent(at: index).title
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        eventsManager.removeEvent(at: index)
        performSegue(withIdentifier: "unwindSegueToMain", sender: self)
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        let newTitle = titleTextField.text ?? ""
        eventsManager.editEvent(Event(title: newTitle, date: Date.init()), at: index)
        performSegue(withIdentifier: "unwindSegueToMain", sender: self)
    }
    
}
