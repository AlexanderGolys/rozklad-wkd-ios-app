//
//  rozklad.swift
//  wkd
//
//  Created by Alexander Golys on 22/02/2019.
//  Copyright © 2019 Alexander Golys. All rights reserved.
//

import UIKit

class rozklad: NSObject {
    
    let rozkladWwaGrodziskDP = [20, 450, 520,    620, 720, 820, 830, 900, 920, 1020,   1120, 1220, 1320, 1420, 1520, 1530,  1620, 1640, 1720, 1740, 1820, 1840,  1920, 1940, 2020, 2120, 2135, 2205, 2220, 2250, 2320, 2350, 2420]
    
    let rozkladWwaMilanDP = [505, 550, 640, 750, 850, 950, 1050, 1150, 1250, 1350, 1450, 1550, 1650, 1750, 1850, 1950, 2050, 2150, 2235]
    
    let rozkladWwaPdkDP = [535, 605, 630, 655, 710, 730, 740, 800, 810, 840, 910, 935, 1005, 1035, 1105, 1135, 1205, 1235, 1305, 1335, 1405, 1435, 1500, 1510, 1540, 1600, 1610, 1630, 1700, 1710, 1730, 1805, 1830, 1905, 1930, 2005, 2035, 2105]
    
    let rozkladPdkMilanDP = [441, 521]
    
    // kolejka specjalna: pdk 00:16, gr 00:25
    
    
    let rozkladGrodziskWwaDP = [351, 406, 431, 446, 501, 516, 546, 616, 631, 646, 721, 741, 831, 931, 1031, 1131, 1231, 1331, 1431, 1446, 1516, 1531, 1546, 1631, 1646, 1741, 1841, 1936, 2036, 2131, 2231, 2346]
    
    let rozkladMilanWwaDP = [538, 608, 708, 808, 908, 1008,1108, 1208, 1308, 1408, 1508, 1608, 1708, 1808, 1908, 2008, 2108, 2208, 2308, 2343]
    
    let rozkladPdkWwaDP = [625, 655, 725, 745, 805, 825, 835, 855, 905, 930, 1000, 1030, 1100, 1130, 1200, 1230, 1300, 1330, 1400, 1430, 1455, 1525, 1555, 1625, 1635, 1655, 1730, 1745, 1805, 1830, 1845, 1905, 1935, 20005, 2035, 2105, 2130, 2200]
    
    let rozkladMilanPdkDP = [503, 2343]
    
    //kolejka specjalna: gr 04:21, pdk 4:31
    
    
    
    let rozkladWwaGrodziskSw = [20, 520, 620, 720, 820, 920, 1020, 1120, 1220, 1320, 1420, 1520, 1620, 1720, 1820, 1920, 2020, 2105, 2120, 2220, 2250, 2320, 2350, 2420]
    
    
    let rozkladWwaMilanSw = [505, 550, 640, 740, 840, 940, 1040, 1140, 1240, 1340, 1540, 1640, 1740, 1840, 1940, 2040, 2150]
    
    
    let rozkladWwaPdkSw = [700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, ]
    
    
    let rozkladPdkMilanSw = [521]
    
    
    let rozkladGrodziskWwaSw = [431, 501, 546, 631, 646, 731, 831, 931, 1031, 1131, 1231, 1331, 1431, 1531, 1631, 1731, 1831, 1931, 2031, 2131, 2231, 2346]
    
    
    let rozkladMilanWwaSw = [538, 608, 708, 758, 858, 958, 1058, 1158, 1258, 1358, 1458, 1658, 1758, 1858, 1958, 2058, 2208, 2308]
    
    
    let rozkladPdkWwaSw = [825, 925, 1025, 1125, 1225, 1325, 1425, 1525, 1625, 1725, 1825, 1925, 2025, 2125]
    
    //kolejka specjalna: gr 4:46, pdk 4:56
    
    
    
    
    
    let odlegloscOdWwa = [0, 2, 5, 7, 9, 11, 13, 15, 19, 20, 22, 25, 27, 29, 32, 34, 36, 38, 41, 43, 45, 48, 43, 45, 47, 49, 50, 53, 55]
    
    
    let odlegloscOdMilana = [48, 46, 43, 41, 39, 36, 34, 32, 29, 27, 25, 23, 21, 19, 15, 13, 11, 9, 7, 5, 3, 0, 0, 0, 0, 0, 0, 0]
    
    
    let odlegloscodGrodzia = [55, 53, 50, 48, 46, 43, 41, 39, 36, 34, 32, 30, 28, 26, 22, 20, 18, 16, 14, 0, 0, 12, 9, 7, 5, 4, 2, 0]
    
    
    let odlegloscOdPdk = [41, 39, 36, 34, 32, 29, 27, 25, 22, 20, 18, 16, 14, 12, 8, 6, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let nazwy = ["Wwa Śródmieście WKD", "Wwa Ochota WKD", "Wwa Zachodnia WKD", "Wwa Reduta Ordona", "Wwa Aleje Jerozolimskie", "Wwa Raków", "Wwa Salomea", "Opacz", "Michałowice", "Reguły", "Malichy", "Tworki", "Pruszków WKD", "Komorów", "Nowa Wieś Warszawska" ,"Kanie Helenowskie" ,"Otrębusy" ,"Podkowa Leśna Wschodnia","Podkowa Leśna Główna","Podkowa Leśna Zachodnia","Polesie","Milanówek Grudów","Kazimierówka","Brzózki","Grodzisk Maz. Okrężna","Grodzisk Maz. Piaskowa","Grodzisk Maz. Jordanowice","Grodzisk Maz. Radońska"]
    
    
    
}
