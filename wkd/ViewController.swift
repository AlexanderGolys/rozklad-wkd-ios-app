//
//  ViewController.swift
//  wkd
//
//  Created by Alexander Golys on 20/02/2019.
//  Copyright © 2019 Alexander Golys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var common = [0, 0, 0, 0]
    
    @IBOutlet weak var b20: UIButton!
    @IBOutlet weak var b19: UIButton!
    @IBOutlet weak var b18: UIButton!
    @IBOutlet weak var b17: UIButton!
    @IBOutlet weak var b16: UIButton!
    @IBOutlet weak var b15: UIButton!
    @IBOutlet weak var b13: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b14: UIButton!
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
    @IBOutlet weak var b22: UIButton!
    @IBOutlet weak var b21: UIButton!
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
    
    func addStP (stNumber:Int) {
        let i = UserDefaults.standard.integer(forKey: "i")
        UserDefaults.standard.set(stNumber, forKey: "stacjaP")
        UserDefaults.standard.set(stNumber, forKey: "c\(i)")
        UserDefaults.standard.set((i+1)%31, forKey: "i")
       
     if !UserDefaults.standard.bool(forKey: "nFirst") {
        self.performSegue(withIdentifier: "first1", sender: nil) }
       else{
        self.performSegue(withIdentifier: "nFirst3", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        if UserDefaults.standard.integer(forKey: "stacjaK") == 21 || UserDefaults.standard.integer(forKey: "stacjaK") == 22 {
            b23.isEnabled = false
            b24.isEnabled = false
            b25.isEnabled = false
            b26.isEnabled = false
            b27.isEnabled = false
            b28.isEnabled = false
        }
        if UserDefaults.standard.integer(forKey: "stacjaK") > 22 {
            b21.isEnabled = false
            b22.isEnabled = false
        }
        super.viewDidLoad() 
        wylacz(button: b1, number: 1)
        wylacz(button: b2, number: 2)
        wylacz(button: b3, number: 3)
        wylacz(button: b4, number: 4)
        wylacz(button: b5, number: 5)
        wylacz(button: b6, number: 6)
        wylacz(button: b7, number: 7)
        wylacz(button: b8, number: 8)
        wylacz(button: b9, number: 9)
        wylacz(button: b10, number: 10)
        wylacz(button: b11, number: 11)
        wylacz(button: b12, number: 12)
        wylacz(button: b13, number: 13)
        wylacz(button: b14, number: 14)
        wylacz(button: b15, number: 15)
        wylacz(button: b16, number: 16)
        wylacz(button: b17, number: 17)
        wylacz(button: b18, number: 18)
        wylacz(button: b19, number: 19)
        wylacz(button: b20, number: 20)
        wylacz(button: b21, number: 21)
        wylacz(button: b22, number: 22)
        wylacz(button: b23, number: 23)
        wylacz(button: b24, number: 24)
        wylacz(button: b25, number: 25)
        wylacz(button: b26, number: 26)
        wylacz(button: b27, number: 27)
        wylacz(button: b28, number: 28)
        
        
        common = zliczanie()
        print(common)
        przyciskiCommon(nr: common[0], button: c1, blue: true)
        przyciskiCommon(nr: common[1], button: c2, blue: true)
        przyciskiCommon(nr: common[2], button: c3, blue: false)
        przyciskiCommon(nr: common[3], button: c4, blue: false)

        wylacz(button: c1, number: common[0])
        wylacz(button: c2, number: common[1])
        wylacz(button: c3, number: common[2])
        wylacz(button: c4, number: common[3])

        }
    
    
    
    @IBAction func c1(_ sender: Any) {
        if common[0] != 0{
            addStP(stNumber: common[0])
        }
        
    }
    @IBAction func c2(_ sender: Any) {
        if common[1] != 0{
            addStP(stNumber: common[1])
        }
    }
    @IBAction func c3(_ sender: Any) {
        if common[2] != 0{
            addStP(stNumber: common[2])
        }
    }
    @IBAction func c4(_ sender: Any) {
        if common[3] != 0{
            addStP(stNumber: common[3])
        }
        
    }
    
    
    
    
    @IBAction func st1(_ sender: Any) {
        addStP(stNumber: 1)
    }
    @IBAction func st2(_ sender: Any) {
        addStP(stNumber: 2)

    }
    @IBAction func st3(_ sender: Any) {
        addStP(stNumber: 3)

    }
    @IBAction func st4(_ sender: Any) {
        addStP(stNumber: 4)

    }
    @IBAction func st5(_ sender: Any) {
        addStP(stNumber: 5)

    }
    @IBAction func st6(_ sender: Any) {
        addStP(stNumber: 6)

    }
    @IBAction func st7(_ sender: Any) {
        addStP(stNumber: 7)

    }
    @IBAction func st8(_ sender: Any) {
        addStP(stNumber: 8)

    }
    @IBAction func st9(_ sender: Any) {
        addStP(stNumber: 9)

    }
    @IBAction func st10(_ sender: Any) {
        addStP(stNumber: 10)

    }
    @IBAction func st11(_ sender: Any) {
        addStP(stNumber: 11)

    }
    @IBAction func st12(_ sender: Any) {
        addStP(stNumber: 12)

    }
    @IBAction func st13(_ sender: Any) {
        addStP(stNumber: 13)

    }
    @IBAction func st14(_ sender: Any) {
        addStP(stNumber: 14)

    }
    @IBAction func st15(_ sender: Any) {
        addStP(stNumber: 15)

    }
    @IBAction func st16(_ sender: Any) {
        addStP(stNumber: 16)

    }
    @IBAction func st17(_ sender: Any) {
        addStP(stNumber: 17)

    }
    @IBAction func st18(_ sender: Any) {
        addStP(stNumber: 18)

    }
    @IBAction func st19(_ sender: Any) {
        addStP(stNumber: 19)

    }
    @IBAction func st20(_ sender: Any) {
        addStP(stNumber: 20)

    }
    @IBAction func mc21(_ sender: Any) {
        addStP(stNumber: 21)

    }
    @IBAction func mc22(_ sender: Any) {
        addStP(stNumber: 22)

    }
    @IBAction func st23(_ sender: Any) {
        addStP(stNumber: 23)

    }
    @IBAction func st24(_ sender: Any) {
        addStP(stNumber: 24)

    }
    @IBAction func st25(_ sender: Any) {
        addStP(stNumber: 25)

    }
    @IBAction func st26(_ sender: Any) {
        addStP(stNumber: 26)

    }
    @IBAction func st27(_ sender: Any) {
        addStP(stNumber: 27)

    }
    @IBAction func st28(_ sender: Any) {
        addStP(stNumber: 28)

    }
    
}

func wylacz (button: UIButton!, number:Int) {
    if UserDefaults.standard.integer(forKey: "stacjaK") == number {
        button.isEnabled = false
    }
}

func zliczanie () -> [Int] {
   var i = 0
    var tab = [Int](repeating: 0, count: 31)
    while i < 31 {
        if (UserDefaults.standard.integer(forKey: "c\(i)") != 0){
            tab[i] = UserDefaults.standard.integer(forKey: "c\(i)")}
        i += 1
    }
    
    
    let set = NSCountedSet(array: tab)
    print(set)
    var tabTupli = [(Int, Int)](repeating: (0, 0), count: 4)
    for element in set {
        tabTupli.append((set.count(for: element), element as! Int))
    }
    tabTupli.sort(by: {$0 < $1})
    tabTupli.reverse()
    
    if (tabTupli[0].1) == 0 {
    return [(tabTupli[1].1), (tabTupli[2].1), (tabTupli[3].1), (tabTupli[4].1)]
    }
    if (tabTupli[1].1) == 0 {
        return [(tabTupli[0].1), (tabTupli[2].1), (tabTupli[3].1), (tabTupli[4].1)]
    }
    if (tabTupli[2].1) == 0 {
        return [(tabTupli[0].1), (tabTupli[1].1), (tabTupli[3].1), (tabTupli[4].1)]
    }
    if (tabTupli[3].1) == 0 {
        return [(tabTupli[0].1), (tabTupli[1].1), (tabTupli[2].1), (tabTupli[4].1)]
    }
    return [(tabTupli[0].1), (tabTupli[1].1), (tabTupli[2].1), (tabTupli[3].1)]

}

func przyciskiCommon (nr:Int, button:UIButton!, blue:Bool) {
    if nr != 0 {
        if blue {
            button.setImage(UIImage(named: "b\(nr)B"), for: UIControl.State.normal)
            button.setImage(UIImage(named: "b\(nr)BP"), for: UIControl.State.highlighted)
        }else {
            button.setImage(UIImage(named: "b\(nr)R"), for: UIControl.State.normal)
            button.setImage(UIImage(named: "b\(nr)RP"), for: UIControl.State.highlighted)
        }
            button.setImage(UIImage(named: "b\(nr)O"), for: UIControl.State.disabled)
    }
}
