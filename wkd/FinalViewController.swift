//
//  FinalViewController.swift
//  wkd
//
//  Created by Alexander Golys on 22/02/2019.
//  Copyright © 2019 Alexander Golys. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    var godzinki = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.bool(forKey: "swieto"))
        
        UserDefaults.standard.set(true, forKey: "nFirst")
        
        godzinki += sprawdzaj()
        wypiszGodzinki(godzinki: godzinki)

        let nazwaStacjaP = rozklad().nazwy[UserDefaults.standard.integer(forKey: "stacjaP") - 1].uppercased()
        
        buttonStP.setTitle(nazwaStacjaP, for: .normal)
        buttonStP.setTitle(nazwaStacjaP, for: .highlighted)

        let nazwaStacjaK = rozklad().nazwy[UserDefaults.standard.integer(forKey: "stacjaK") - 1].uppercased()
        
        buttonStK.setTitle(nazwaStacjaK, for: .normal)
        buttonStK.setTitle(nazwaStacjaK, for: .highlighted)

        
        odGodziny.text = "OD GODZINY: " + (konwertuj(a: UserDefaults.standard.integer(forKey: "time")))
    }
    
    @IBOutlet weak var g1: UILabel!
    
    @IBOutlet weak var g2: UILabel!
    
    @IBOutlet weak var g3: UILabel!
    
    @IBOutlet weak var g4: UILabel!
    
    @IBOutlet weak var g5: UILabel!
    
    @IBOutlet weak var p1: UILabel!
    
    @IBOutlet weak var p2: UILabel!
    
    @IBOutlet weak var p3: UILabel!
    
    @IBOutlet weak var p4: UILabel!
    
    @IBOutlet weak var p5: UILabel!
    
    
    func wypiszGodzinki(godzinki: [Int]) {
        if godzinki.count == 0{
            g1.text = "błąd"
            g2.text = ""
            g3.text = ""
            g4.text = ""
            g5.text = ""
            p1.text = ""
            p2.text = ""
            p3.text = ""
            p4.text = ""
            p5.text = ""
        }
        if godzinki.count == 1{
            g1.text = konwertuj(a: godzinki[0])
            g2.text = ""
            g3.text = ""
            g4.text = ""
            g5.text = ""
            p1.text = przyjazd(czasP: godzinki[0])
            p2.text = ""
            p3.text = ""
            p4.text = ""
            p5.text = ""
        }
        if godzinki.count == 2{
            g1.text = konwertuj(a: godzinki[0])
            g2.text = konwertuj(a: godzinki[1])
            g3.text = ""
            g4.text = ""
            g5.text = ""
            p1.text = przyjazd(czasP: godzinki[0])
            p2.text = przyjazd(czasP: godzinki[1])
            p3.text = ""
            p4.text = ""
            p5.text = ""
        }
        if godzinki.count == 3{
            g1.text = konwertuj(a: godzinki[0])
            g2.text = konwertuj(a: godzinki[1])
            g3.text = konwertuj(a: godzinki[2])
            g4.text = ""
            g5.text = ""
            p1.text = przyjazd(czasP: godzinki[0])
            p2.text = przyjazd(czasP: godzinki[1])
            p3.text = przyjazd(czasP: godzinki[2])
            p4.text = ""
            p5.text = ""
        }
        if godzinki.count == 4{
            g1.text = konwertuj(a: godzinki[0])
            g2.text = konwertuj(a: godzinki[1])
            g3.text = konwertuj(a: godzinki[2])
            g4.text = konwertuj(a: godzinki[3])
            g5.text = ""
            p1.text = przyjazd(czasP: godzinki[0])
            p2.text = przyjazd(czasP: godzinki[1])
            p3.text = przyjazd(czasP: godzinki[2])
            p4.text = przyjazd(czasP: godzinki[3])
            p5.text = ""
        }
        if godzinki.count >= 5 {
            g1.text = konwertuj(a: godzinki[0])
            g2.text = konwertuj(a: godzinki[1])
            g3.text = konwertuj(a: godzinki[2])
            g4.text = konwertuj(a: godzinki[3])
            g5.text = konwertuj(a: godzinki[4])
            p1.text = przyjazd(czasP: godzinki[0])
            p2.text = przyjazd(czasP: godzinki[1])
            p3.text = przyjazd(czasP: godzinki[2])
            p4.text = przyjazd(czasP: godzinki[3])
            p5.text = przyjazd(czasP: godzinki[4])
        }
        
    }

    
    func konwertuj (a:Int) -> String{
        if a%100 < 10 && ((a - a%100)/100)%24 < 10{
        return "0" + String(((a - a%100)/100)%24) + ":0" + String((a%100))
        }
        if a%100 < 10 && ((a - a%100)/100)%24 > 9{
        return String(((a - a%100)/100)%24) + ":0" + String((a%100))
        }
        if a%100 > 9 && ((a - a%100)/100)%24 < 10{
            return "0" + String(((a - a%100)/100)%24) + ":" + String((a%100))
        }
        else{
            return String(((a - a%100)/100)%24) + ":" + String((a%100))
        }
    }
    
    
    @IBOutlet weak var buttonStP: UIButton!
    @IBAction func stP(_ sender: Any) {
        self.performSegue(withIdentifier: "nFirst1", sender: nil)
    }
    
    @IBOutlet weak var buttonStK: UIButton!
    @IBAction func stK(_ sender: Any) {
        self.performSegue(withIdentifier: "nFirst2", sender: nil)
    }
    
    @IBOutlet weak var buttonTime: UIButton!
    @IBAction func stT(_ sender: Any) {
        self.performSegue(withIdentifier: "nFirst5", sender: nil)
    }
    @IBOutlet weak var odGodziny: UILabel!

    @IBAction func oAplikacji(_ sender: Any) {
        self.performSegue(withIdentifier: "oAplikacji", sender: nil)
    }
    


func sprawdzaj () -> [Int]
{
    if UserDefaults.standard.bool(forKey: "swieto") {
       return sprawdzSw()
    }else{
       return sprawdzDP()
    }
}

func sprawdzSw() -> [Int]{
    
    var coPokazac = [Int]()
    var rozklad = [Int]()

    let typTrasy = dajTypTrasy()
    switch (typTrasy){
    case 1:
        rozklad.append(contentsOf: rozkladDla1sw(sw: true))
    case 2:
        rozklad.append(contentsOf: rozkladDla2sw(sw: true))
    case 3:
        rozklad.append(contentsOf: rozkladDla3sw(sw: true))
    case 4:
        rozklad.append(contentsOf: rozkladDla4sw(sw: true))
    case 5:
        rozklad.append(contentsOf: rozkladDla5sw(sw: true))
    case 6:
        rozklad.append(contentsOf: rozkladDla6sw(sw: true))
    default:
        print(0)
    }
    
        for element in rozklad {
            if element >= UserDefaults.standard.integer(forKey: "time") {
                coPokazac.append(element)
            }
    }
    return coPokazac
}


func sprawdzDP() -> [Int]{
    
    var coPokazac = [Int]()
    var rozklad = [Int]()
    
    let typTrasy = dajTypTrasy()
    switch (typTrasy){
    case 1:
        rozklad.append(contentsOf: rozkladDla1sw(sw: false))
    case 2:
        rozklad.append(contentsOf: rozkladDla2sw(sw: false))
    case 3:
        rozklad.append(contentsOf: rozkladDla3sw(sw: false))
    case 4:
        rozklad.append(contentsOf: rozkladDla4sw(sw: false))
    case 5:
        rozklad.append(contentsOf: rozkladDla5sw(sw: false))
    case 6:
        rozklad.append(contentsOf: rozkladDla6sw(sw: false))
    default:
        print(0)
    }
    
    for element in rozklad {
        if element > UserDefaults.standard.integer(forKey: "time") {
            coPokazac.append(element)
        }
    }
    return coPokazac
}




func dajTypTrasy() -> Int {
    let stP = UserDefaults.standard.integer(forKey: "stacjaP")
    let stK = UserDefaults.standard.integer(forKey: "stacjaK")

    if stP < 21 && stK < 21 && stP > stK {
       
        return 1
    }
    if stP < 21 && stK < 21 && stP < stK {
        
        return 2
    }
    if stP < 23 && stK < 23 && stP > stK {
        
        return 3
    }
    if stP < 23 && stK < 23 && stP < stK {

        return 4
    }
    if stP > stK {
       
        return 5
    }
   
    return 6
}

func rozkladDla1sw(sw:Bool) -> [Int]{
    var pomoc1:[Int], pomoc2:[Int], final:[Int]
    if sw {
        pomoc1 = rozklad().rozkladPdkWwaSw
    }else{
        pomoc1 = rozklad().rozkladPdkWwaDP
    }
    
    for (index, _) in pomoc1.enumerated() {
        pomoc1[index] = dodaj(a: pomoc1[index], b: rozklad().odlegloscOdPdk[UserDefaults.standard.integer(forKey: "stacjaP") - 1])
    }
    
    if sw{
        pomoc2 = rozklad().rozkladMilanWwaSw
    }else{
        pomoc2 = rozklad().rozkladMilanWwaDP
    }
    
    for (index, _) in pomoc2.enumerated() {
        pomoc2[index] = dodaj(a:pomoc2[index], b:rozklad().odlegloscOdMilana[UserDefaults.standard.integer(forKey: "stacjaP") - 1])
    }
    if sw {
        
    final = rozklad().rozkladGrodziskWwaSw
    }else{
        final = rozklad().rozkladGrodziskWwaDP
    }
    for (index, _) in final.enumerated() {
        final[index] = dodaj(a:final[index], b:rozklad().odlegloscodGrodzia[UserDefaults.standard.integer(forKey: "stacjaP") - 1])
    }
    final.append(contentsOf: pomoc1)
    final.append(contentsOf: pomoc2)
    final.sort()

    return final
}


func rozkladDla2sw(sw:Bool) -> [Int]{
    var pomoc1:[Int], pomoc2:[Int], final:[Int]
    if sw {
        pomoc1 = rozklad().rozkladWwaPdkSw
    }else{
        pomoc1 = rozklad().rozkladWwaPdkDP
    }
    
    for (index, _) in pomoc1.enumerated() {
        pomoc1[index] = dodaj(a:pomoc1[index], b: rozklad().odlegloscOdWwa[UserDefaults.standard.integer(forKey: "stacjaP") - 1])
    }
    if sw {
        pomoc2 = rozklad().rozkladWwaMilanSw
    }else{
        pomoc2 = rozklad().rozkladWwaMilanDP
        
    }
    for (index, _) in pomoc2.enumerated() {
        pomoc2[index] = dodaj(a:pomoc2[index], b: rozklad().odlegloscOdWwa[UserDefaults.standard.integer(forKey: "stacjaP") - 1])
    }
    if sw {
        final = rozklad().rozkladWwaGrodziskSw
    }else{
        final = rozklad().rozkladWwaGrodziskDP
        
    }
    for (index, _) in final.enumerated() {
        final[index] = dodaj(a:final[index], b: rozklad().odlegloscOdWwa[UserDefaults.standard.integer(forKey: "stacjaP") - 1])
    }
    final.append(contentsOf: pomoc1)
    final.append(contentsOf: pomoc2)
    final.sort()
    
    return final
}



func rozkladDla3sw(sw:Bool) -> [Int]{
    var final:[Int]
    if sw {
    final = rozklad().rozkladMilanWwaSw
    }else{
    final = rozklad().rozkladMilanWwaDP
    }
    
    for (index, _) in final.enumerated() {
        final[index] = dodaj(a:final[index], b: rozklad().odlegloscOdMilana[UserDefaults.standard.integer(forKey: "stacjaP") - 1])
    }
    if !sw && UserDefaults.standard.integer(forKey: "StacjaK") > 18 {
        final.append(dodaj(a: 503, b: rozklad().odlegloscOdMilana[UserDefaults.standard.integer(forKey: "stacjaP") - 1]))
        final.append(dodaj(a: 2343, b: rozklad().odlegloscOdMilana[UserDefaults.standard.integer(forKey: "stacjaP") - 1]))
    }
    
    final.sort()
    return final
}

func rozkladDla4sw(sw:Bool) -> [Int]{
    
    var final:[Int]
    if sw {
        final = rozklad().rozkladWwaMilanSw
    }else{
        final = rozklad().rozkladWwaMilanDP
    }
    
    
    for (index, _) in final.enumerated() {
        final[index] = dodaj(a:final[index], b: rozklad().odlegloscOdWwa[UserDefaults.standard.integer(forKey: "stacjaP") - 1])
        }
    
    if sw && UserDefaults.standard.integer(forKey: "stacjaP") == 21 || UserDefaults.standard.integer(forKey: "stacjaP") == 20 || UserDefaults.standard.integer(forKey: "stacjaP") == 19 {
        final.append(dodaj(a: 521, b: rozklad().odlegloscOdWwa[UserDefaults.standard.integer(forKey: "stacjaP") - 1]))
    }
    if !sw && UserDefaults.standard.integer(forKey: "stacjaP") == 21 || UserDefaults.standard.integer(forKey: "stacjaP") == 20 || UserDefaults.standard.integer(forKey: "stacjaP") == 19 {
        final.append(dodaj(a: 441, b: rozklad().odlegloscOdWwa[UserDefaults.standard.integer(forKey: "stacjaP") - 1]))
        final.append(dodaj(a: 521, b: rozklad().odlegloscOdWwa[UserDefaults.standard.integer(forKey: "stacjaP") - 1]))
    }
    
    
    final.sort()
    
    return final
}

func rozkladDla5sw(sw:Bool) -> [Int]{
    print("tu jestem")
    var final = [Int]()
    if sw {
        final = rozklad().rozkladGrodziskWwaSw
    }else{
        final = rozklad().rozkladGrodziskWwaDP
    }
    for (index, _) in final.enumerated() {
        final[index] = dodaj(a:final[index], b:rozklad().odlegloscodGrodzia[UserDefaults.standard.integer(forKey: "stacjaP") - 1])
    }
    
    if sw && UserDefaults.standard.integer(forKey: "StacjaP") == 28 && UserDefaults.standard.integer(forKey: "StacjaK") == 19 {
        final.append(dodaj(a: 446, b: rozklad().odlegloscodGrodzia[UserDefaults.standard.integer(forKey: "stacjaP") - 1]))
    }
    
    if !sw && UserDefaults.standard.integer(forKey: "StacjaP") == 28 && UserDefaults.standard.integer(forKey: "StacjaK") == 19 {
        final.append(dodaj(a: 421, b: rozklad().odlegloscodGrodzia[UserDefaults.standard.integer(forKey: "stacjaP") - 1]))
    }
    
        final.sort()
        return final
    
}
func rozkladDla6sw(sw:Bool) -> [Int]{
 
    var final:[Int]
    if sw {
        final = rozklad().rozkladWwaGrodziskSw
    }
    else {
        final = rozklad().rozkladWwaGrodziskDP
    }
    for (index, _) in final.enumerated() {
        final[index] = dodaj(a:final[index], b: rozklad().odlegloscOdWwa[UserDefaults.standard.integer(forKey: "stacjaP") - 1])
    }
    
    if !sw && UserDefaults.standard.integer(forKey: "StacjaP") == 19 && UserDefaults.standard.integer(forKey: "StacjaK") == 28 {
        final.append(16)
    }
    final.sort()
    return final
}

func dodaj (a:Int, b:Int) -> Int {
    if (a%100 + b)%60 != (a%100 + b){
        return (a%100 + b)%60 + a - a%100 + 100}
    else {
        return (a%100 + b)%60 + a - a%100
    }
}


func odlegloscStPOdStK() -> Int {
   return rozklad().odlegloscOdWwa[UserDefaults.standard.integer(forKey: "stacjaP") - 1] - rozklad().odlegloscOdWwa[UserDefaults.standard.integer(forKey: "stacjaK") - 1]
}

func przyjazd (czasP:Int) -> String
{
    return konwertuj(a: dodaj(a:czasP, b: odlegloscStPOdStK()))
}
}
