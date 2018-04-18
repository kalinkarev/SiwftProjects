//
//  NoteViewController.swift
//  ProjectPassingDataFromOneViewToAnother
//
//  Created by Kalin Karev on 4/18/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    // MARK: Properties
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadSampleData()

        print("The array is: \(notes)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NoteViewController {
    private func loadSampleData() {
        guard let note1 = Note(name: "have breakfast") else {
            fatalError("Unable to instantiate note1")
        }
        guard let note2 = Note(name: "have lunch") else {
            fatalError("Unable to instantiate note2")
        }
        guard let note3 = Note(name: "have dinner") else {
            fatalError("Unable to instantiate note3")
        }
        
        notes += [note1, note2, note3]
    }
}

extension NoteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "noteTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NoteTableViewCell else {
            fatalError("The dequed cell is not an instance of NoteTableViewCell.")
        }
        
        // Fetch item
        let note = notes[indexPath.row]
        
        // Configure Cell
        cell.nameLabel.text = note.name
        
        return cell
    }
}
