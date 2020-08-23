//
//  ViewController.swift
//  Events
//
//  Created by Zofia Drabek on 09/02/2020.
//  Copyright © 2020 Zofia Drabek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var eventsManager = EventsManager()
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createButtonTapped(_ sender: Any) {
        let eventTitle = titleTextField.text ?? ""
        titleTextField.text = ""
        eventsManager.addEvent(title: eventTitle, date: Date.init())
        self.view.endEditing(true)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detailSegue" else { return }
        let destinationVC = segue.destination as? DetailViewController
        guard let index = sender as? Int else { return }
        destinationVC?.eventsManager = eventsManager
        destinationVC?.index = index
    }
    
    @IBAction func unwindSegueCalled(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsManager.getNumberOfEvents()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        
        let event = eventsManager.getEvent(at: indexPath.row)
        cell.textLabel?.text = event.title
        cell.detailTextLabel?.text = "\(event.date)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "detailSegue", sender: indexPath.row)
    }
    
}
