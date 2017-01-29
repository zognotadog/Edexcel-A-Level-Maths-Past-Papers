//
//  C2TableVC.swift
//  Edexcel A-Level Maths Past Papers
//
//  Created by Alex Asher on 29/01/2017.
//  Copyright © 2017 Appsher. All rights reserved.
//

import UIKit
import PDFReader

class C2TableVC: UITableViewController {
    
    var paperDates: Array = [String]()
    var selectedDate: Int!
    var vcSender: String = "C2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paperDates = ["June 2015", "June 2014", "January 2013", "June 2013", "January 2012", "June 2012", "January 2011", "June 2011", "January 2010", "June 2010", "January 2009", "June 2009", "January 2008", "June 2008", "January 2007", "June 2007", "January 2006", "January 2005", "June 2005"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paperDates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = paperDates[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDate = indexPath.row
        print(selectedDate!)
        
        self.performSegue(withIdentifier: "CellSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CellSegue" {
            print("Segue: \(selectedDate!)")
            let destinationVC: PaperSelectVC = segue.destination as! PaperSelectVC
            destinationVC.selectedDate = selectedDate!
            destinationVC.paperDates = paperDates
            destinationVC.vcSender = vcSender
            
        }
    }
}

