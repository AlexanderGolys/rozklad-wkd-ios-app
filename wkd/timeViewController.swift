//
//  timeViewController.swift
//  wkd
//
//  Created by Alexander Golys on 21/02/2019.
//  Copyright © 2019 Alexander Golys. All rights reserved.
//

import UIKit

class timeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      if UserDefaults.standard.bool(forKey: "swieto"){
          switchSwieto.setOn(true, animated: false)
       }
    }
    
    @IBAction func swieto(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaults.standard.set(true, forKey: "swieto")}
        else{
                UserDefaults.standard.set(false, forKey: "swieto")
        }
    }
    
   @IBOutlet weak var switchSwieto: UISwitch!
    @IBOutlet weak var time: UIDatePicker!
    @IBAction func done(_ sender: Any) {
        let selectedTime = time.date
        let calendar = Calendar.current
        let timeToCheck = 100*calendar.component(.hour, from: selectedTime) + calendar.component(.minute, from: selectedTime)
        UserDefaults.standard.set(timeToCheck, forKey: "time")
        
        
        self.performSegue(withIdentifier: "standard", sender: nil)
        
        
    }
}
