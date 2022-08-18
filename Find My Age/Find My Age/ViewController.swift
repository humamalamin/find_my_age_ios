//
//  ViewController.swift
//  Find My Age
//
//  Created by Humam Al Amin on 18/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var ageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateMyAge(_ sender: Any) {
//        Get selected date from datepicker
        let birthDate = self.datePicker.date
        
        let today = Date()
        
        if birthDate >= today {
            let alertController = UIAlertController(title: "error", message: "Please enter a valid date", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "yes", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
//        create an instance of the user's currrent calendar
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.year, .month, .day], from: birthDate, to: today)
        
        guard let ageYears = components.year else {return}
        guard let ageMonths = components.month else {return}
        guard let ageDays = components.day else {return}
            
        self.ageLabel.text = "\(ageYears) years, \(ageMonths) month, \(ageDays) day"
    }
    
}

