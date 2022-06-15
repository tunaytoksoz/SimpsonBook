//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Tunay Toksöz on 15.06.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [simpson]()
    
    var chosenSimpson : simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        //simpson object
        
        let homer = simpson(name: "Homer", job: "Nuclear Safety", image: UIImage(named: "Homer")!)
        
        let marge = simpson(name: "Marge", job: "Marge is a very talented painter.", image: UIImage(named: "marge")!)
        
        let bart = simpson(name: "Bart", job: "Student", image: UIImage(named: "bart")!)
        
        let lisa = simpson(name: "Lisa", job: "Student", image: UIImage(named: "lisa")!)
        
        let burns = simpson(name: "Burns", job: "Owner of the Springfield Nuclear Power Plant", image: UIImage(named: "burns")!)
        
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(burns)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }

}

