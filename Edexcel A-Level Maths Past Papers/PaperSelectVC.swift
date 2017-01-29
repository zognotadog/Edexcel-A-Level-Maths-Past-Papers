//
//  PaperSelectVC.swift
//  Edexcel A-Level Maths Past Papers
//
//  Created by Alex Asher on 29/01/2017.
//  Copyright © 2017 Appsher. All rights reserved.
//

import UIKit
import PDFReader

class PaperSelectVC: UIViewController {
    
    var selectedDate: Int!
    var questionPaper: String?
    var markScheme: String?
    var paperDates: Array? = [String]()
    var vcSender: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionPaper = "\(selectedDate!)QP"
        markScheme = "\(selectedDate!)MS"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    @IBAction func questionPaperButton(_ sender: Any) {
        let documentURL = Bundle.main.url(forResource: questionPaper!, withExtension: "pdf", subdirectory: vcSender)!
        let document = PDFDocument(fileURL: documentURL)!
        
        let readerController = PDFViewController.createNew(with: document, title: "\(paperDates![selectedDate!]) Question Paper", actionStyle: .activitySheet)
        navigationController?.pushViewController(readerController, animated: true)
        
    }
    
    
    
    @IBAction func markSchemeButton(_ sender: Any) {
        let documentURL = Bundle.main.url(forResource: markScheme!, withExtension: "pdf", subdirectory: vcSender)!
        let document = PDFDocument(fileURL: documentURL)!
        
        let readerController = PDFViewController.createNew(with: document, title: "\(paperDates![selectedDate!]) Mark Scheme", actionStyle: .activitySheet )
        navigationController?.pushViewController(readerController, animated: true)
    }

    /// Action button style
    public enum ActionStyle {
        /// Brings up a print modal allowing user to print current PDF
        case print
        
        /// Brings up an activity sheet to share or open PDF in another app
        case activitySheet
        
        /// Performs a custom action
        case customAction((Void) -> ())
    }
    
    
}
    
    
    



