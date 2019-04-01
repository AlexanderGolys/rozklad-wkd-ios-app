//
//  stKViewController.swift
//  wkd
//
//  Created by Alexander Golys on 21/02/2019.
//  Copyright © 2019 Alexander Golys. All rights reserved.
//

import UIKit

class stKViewController: UIViewController {
    
    var common = [0, 0, 0, 0]


    @IBOutlet weak var b20: UIButton!
    @IBOutlet weak var b19: UIButton!
    @IBOutlet weak var b18: UIButton!
    @IBOutlet weak var b17: UIButton!
    @IBOutlet weak var b16: UIButton!
    @IBOutlet weak var b15: UIButton!
    @IBOutlet weak var b14: UIButton!
    @IBOutlet weak var b13: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b10: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b21: UIButton!
    @IBOutlet weak var b22: UIButton!
    @IBOutlet weak var b23: UIButton!
    @IBOutlet weak var b24: UIButton!
    @IBOutlet weak var b25: UIButton!
    @IBOutlet weak var b26: UIButton!
    @IBOutlet weak var b27: UIButton!
    @IBOutlet weak var b28: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var c4: UIButton!
    
    
    
    
    
    func addStK (stNumber:Int) {
        UserDefaults.standard.set(stNumber, forKey: "stacjaK")
        
        let i = UserDefaults.standard.integer(forKey: "i")
        UserDefaults.standard.set(stNumber, forKey: "c\(i)")
        UserDefaults.standard.set((i+1)%31, forKey: "i")
        
        
          if !UserDefaults.standard.bool(forKey: "nFirst"){
            self.performSegue(withIdentifier: "first2", sender: nil) }
          else{
            self.performSegue(withIdentifier: "nFirst4", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        wylacz(button: b1, numer: 1)
        wylacz(button: b2, numer: 2)
        wylacz(button: b3, numer: 3)
        wylacz(button: b4, numer: 4)
        wylacz(button: b5, numer: 5)
        wylacz(button: b6, numer: 6)
        wylacz(button: b7, numer: 7)
        wylacz(button: b8, numer: 8)
        wylacz(button: b9, numer: 9)
        wylacz(button: b10, numer: 10)
        wylacz(button: b11, numer: 11)
        wylacz(button: b12, numer: 12)
        wylacz(button: b13, numer: 13)
        wylacz(button: b14, numer: 14)
        wylacz(button: b15, numer: 15)
        wylacz(button: b16, numer: 16)
        wylacz(button: b17, numer: 17)
        wylacz(button: b18, numer: 18)
        wylacz(button: b19, numer: 19)
        wylacz(button: b20, numer: 20)
        wylacz(button: b21, numer: 21)
        wylacz(button: b22, numer: 22)
        wylacz(button: b23, numer: 23)
        wylacz(button: b24, numer: 24)
        wylacz(button: b25, numer: 25)
        wylacz(button: b26, numer: 26)
        wylacz(button: b27, numer: 27)
        wylacz(button: b28, numer: 28)
        
        common = zliczanie()
        
        if UserDefaults.standard.integer(forKey: "stacjaP") == 21 || UserDefaults.standard.integer(forKey: "stacjaP") == 22 {
            b23.isEnabled = false
            b24.isEnabled = false
            b25.isEnabled = false
            b26.isEnabled = false
            b27.isEnabled = false
            b28.isEnabled = false
            if common[0] > 22 {
                c1.isEnabled = false
            }
            if common[1] > 22 {
                c2.isEnabled = false
            }
            if common[2] > 22 {
                c3.isEnabled = false
            }
            if common[3] > 22 {
                c4.isEnabled = false
            }
        }
        if UserDefaults.standard.integer(forKey: "stacjaP") > 22 {
            b21.isEnabled = false
            b22.isEnabled = false
            if common[0] == 21 || common[0] == 22 {
                c1.isEnabled = false
            }
            if common[1] == 21 || common[1] == 22 {
                c2.isEnabled = false
            }
            if common[2] == 21 || common[2] == 22 {
                c3.isEnabled = false
            }
            if common[3] == 21 || common[3] == 22 {
                c4.isEnabled = false
            }
        }
        
        
        przyciskiCommon(nr: common[0], button: c1, blue: true)
        przyciskiCommon(nr: common[1], button: c2, blue: true)
        przyciskiCommon(nr: common[2], button: c3, blue: false)
        przyciskiCommon(nr: common[3], button: c4, blue: false)
        
        
        wylacz(button: c1, numer: common[0])
        wylacz(button: c2, numer: common[1])
        wylacz(button: c3, numer: common[2])
        wylacz(button: c4, numer: common[3])

        
    }
    
    @IBAction func c1(_ sender: Any) {
        if common[0] != 0{
        addStK(stNumber: common[0])
        }
    }
    
    @IBAction func c2(_ sender: Any) {
        if common[1] != 0{
            addStK(stNumber: common[1])
        }
    }
    
    @IBAction func c3(_ sender: Any) {
        if common[2] != 0{
            addStK(stNumber: common[2])
        }
    }
    
    @IBAction func c4(_ sender: Any) {
        if common[3] != 0{
            addStK(stNumber: common[3])
        }
    }
    
    
    @IBAction func st1(_ sender: Any) {
        addStK(stNumber: 1)
    }
    @IBAction func st2(_ sender: Any) {
        addStK(stNumber: 2)
        
    }
    @IBAction func st3(_ sender: Any) {
        addStK(stNumber: 3)
        
    }
    @IBAction func st4(_ sender: Any) {
        addStK(stNumber: 4)
        
    }
    @IBAction func st5(_ sender: Any) {
        addStK(stNumber: 5)
        
    }
    @IBAction func st6(_ sender: Any) {
        addStK(stNumber: 6)
        
    }
    @IBAction func st7(_ sender: Any) {
        addStK(stNumber: 7)
        
    }
    @IBAction func st8(_ sender: Any) {
        addStK(stNumber: 8)
        
    }
    @IBAction func st9(_ sender: Any) {
        addStK(stNumber: 9)
        
    }
    @IBAction func st10(_ sender: Any) {
        addStK(stNumber: 10)
        
    }
    @IBAction func st11(_ sender: Any) {
        addStK(stNumber: 11)
        
    }
    @IBAction func st12(_ sender: Any) {
        addStK(stNumber: 12)
        
    }
    @IBAction func st13(_ sender: Any) {
        addStK(stNumber: 13)
        
    }
    @IBAction func st14(_ sender: Any) {
        addStK(stNumber: 14)
        
    }
    @IBAction func st15(_ sender: Any) {
        addStK(stNumber: 15)
        
    }
    @IBAction func st16(_ sender: Any) {
        addStK(stNumber: 16)
        
    }
    @IBAction func st17(_ sender: Any) {
        addStK(stNumber: 17)
        
    }
    @IBAction func st18(_ sender: Any) {
        addStK(stNumber: 18)
        
    }
    @IBAction func st19(_ sender: Any) {
        addStK(stNumber: 19)
        
    }
    @IBAction func st20(_ sender: Any) {
        addStK(stNumber: 20)
        
    }
    @IBAction func mc21(_ sender: Any) {
        addStK(stNumber: 21)
    }
    
    @IBAction func mc22(_ sender: Any) {
        addStK(stNumber: 22)
        
    }
    @IBAction func st23(_ sender: Any) {
        addStK(stNumber: 23)
        
    }
    @IBAction func st24(_ sender: Any) {
        addStK(stNumber: 24)
        
    }
    @IBAction func st25(_ sender: Any) {
        addStK(stNumber: 25)
        
    }
    @IBAction func st26(_ sender: Any) {
        addStK(stNumber: 26)
        
    }
    @IBAction func st27(_ sender: Any) {
        addStK(stNumber: 27)
        
    }
    @IBAction func st28(_ sender: Any) {
        addStK(stNumber: 28)
        
    }
    
    func wylacz (button: UIButton!, numer:Int) {
        if UserDefaults.standard.integer(forKey: "stacjaP") == numer {
            button.isEnabled = false
        }
    }
    
}

