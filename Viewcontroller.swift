//
//  ViewController.swift
//  maytinh2
//
//  Created by VietAnh on 6/24/17.
//  Copyright © 2017 VietAnh. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var kq1: UILabel!
    @IBOutlet weak var kq2: UILabel!
    @IBOutlet weak var kq3: UILabel!
    @IBOutlet weak var lbdau: UILabel!
    @IBOutlet var mk: [UIButton]!
    
    
    var bien1:Double = 0
    var bien2:Double = 0
    var bienkq:Double = 0
    var dau:String = ""
    var provl:Bool = true
    var codaucham:Bool = true
    var cobien1 = true
    var tinhtiep = false
    var xoadong = 1
    let formatter = NumberFormatter()
    
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in mk {
            i.layer.backgroundColor = UIColor.green.cgColor
            i.layer.borderWidth = 2
            i.layer.borderColor = UIColor.blue.cgColor
            i.layer.cornerRadius = i.frame.size.height / 2
            i.clipsToBounds = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func btnum(_ sender: UIButton) {
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 10
        
        if cobien1 {
        if provl == true {
            
            
                bienkq = 0
                kq1.text? += String(sender.tag-1)
                bien1 = Double(kq1.text!)!
                xoadong = 1
            
        }
        else {
            
            kq2.text? += String(sender.tag-1)
            bien2 = Double(kq2.text!)!
            xoadong = 3
            }
            
        }
        else {
            
            kq1.text = ""
            kq2.text = ""
            kq3.text = ""
            bien1 = 0
            bien2 = 0
            bienkq = 0
            kq1.text? += String(sender.tag-1)
            bien1 = Double(kq1.text!)!
            cobien1 = true
            tinhtiep = false
            codaucham = true
            
    }
        
    }
    
    @IBAction func btdau(_ sender: UIButton) {
        switch sender.tag {
        case 12:fnthaydau(fndau: "+", fnbien: bien1 + bien2,fnxoadong: 1)
        case 13:fnthaydau(fndau: "-", fnbien: bien1 - bien2,fnxoadong: 1)
        case 14:
            if bien2 != 0 {
               fnthaydau(fndau: "*", fnbien: bien1 * bien2, fnxoadong: 1)
            } else {
                fnthaydau(fndau: "*", fnbien: bien1 * 1, fnxoadong: 1)
            }
            
        case 15:
            if bien2 != 0 {
                fnthaydau(fndau: "/", fnbien: bien1 / bien2, fnxoadong: 1)
            } else {
                fnthaydau(fndau: "/", fnbien: bien1 / 1, fnxoadong: 1)
            }
        default:
            print("Error nut dau")
        }
        provl = false
    }
    
    
    @IBAction func btkq(_ sender: Any) {
        if kq2.text == "" || kq2.text == "0"{
            bienkq = bien1
            bien2 = 0
            if (bien1 < 1 && bien1 > -1 && bien1.truncatingRemainder(dividingBy: 1) != 0){
                kq1.text = String(bien1)
            } else {
                kq1.text = formatter.string(from: bien1 as NSNumber) ?? "n/a"
            }
            kq2.text = formatter.string(from: bien2 as NSNumber) ?? "n/a"
            if (bienkq < 1 && bienkq > -1 && bienkq.truncatingRemainder(dividingBy: 1) != 0){
                kq3.text = String(bienkq)
            } else {
                kq3.text = formatter.string(from: bienkq as NSNumber) ?? "n/a"
            }
            cobien1 = false
        }
            
        else {
        switch dau {
        case "+":
            fndaukq(bkq: bienkq + bien2)
        case "-":
            fndaukq(bkq: bienkq - bien2)
        case "*":
            fndaukq(bkq: bienkq * bien2)
        case "/":
            fndaukq(bkq: bienkq / bien2)
        default:
            bienkq = bien1
            }
        kq1.text = formatter.string(from: bien1 as NSNumber) ?? "n/a"
        kq2.text = formatter.string(from: bien2 as NSNumber) ?? "n/a"
        kq3.text = formatter.string(from: bienkq as NSNumber) ?? "n/a"
    }
    }
    @IBAction func btamduong(_ sender: UIButton) {
        switch xoadong {
        case 1:
            bien1 = 0 - bien1
            kq1.text = formatter.string(from: bien1 as NSNumber) ?? "n/a"
        case 2:
            bien2 = 0 - bien2
            kq2.text = formatter.string(from: bien2 as NSNumber) ?? "n/a"
        default:
            bienkq = 0 - bienkq
            kq3.text = formatter.string(from: bienkq as NSNumber) ?? "n/a"
        }
    }
    @IBAction func btdel(_ sender: Any) {
        switch xoadong {
        case 1:
            kq1.text = ""
            bien1 = 0
            provl = true
        case 2:
            lbdau.text = ""
            dau = ""
            bien2 = 0
            xoadong -= 1
            provl = true
        case 3:
            kq2.text = ""
            bien2 = 0
            xoadong -= 1
            provl = false
        default:
            kq1.text = ""
            kq2.text = ""
            kq3.text = ""
            xoadong = 1
            
        }
        codaucham = true
}
    @IBAction func btcham(_ sender: UIButton) {
        if !(kq3.text?.isEmpty)! {
            self.btdel(4)
        }
        if provl {
        if codaucham {
            if (kq1.text?.isEmpty)! {
                    kq1.text? += "0."
                } else {
                    kq1.text? += "."
                }
                codaucham = false
            } else {
                kq1.text? += ""
            }
            cobien1 = true
        } else {
            if codaucham {
                if (kq2.text?.isEmpty)! {
                    kq2.text? += "0."
                } else {
                    kq2.text? += "."
                }
                codaucham = false
            } else {
                kq2.text? += ""
            }
        }
    }
    func fnthaydau (fndau:String, fnbien:Double, fnxoadong:Int){
        if tinhtiep {
            bien1 = bienkq
            bien2 = 0
            dau = fndau
            if (bien1 < 1 && bien1 > -1 && bien1.truncatingRemainder(dividingBy: 1) != 0){
                kq1.text = String(bien1)
            } else {
            kq1.text = formatter.string(from: bien1 as NSNumber) ?? "n/a"
            kq2.text = ""
            kq3.text = ""
            tinhtiep = false
            cobien1 = true
            xoadong = fnxoadong
            }}
        else{
            kq2.text = ""
            bien1 = fnbien
            bien2 = 0
            bienkq = bien1
            dau = fndau
            if (bien1 < 1 && bien1 > -1) && bien1.truncatingRemainder(dividingBy: 1) != 0{
                kq1.text = String(bien1)
                print(bien1.truncatingRemainder(dividingBy: 1))
            } else {
            kq1.text = formatter.string(from: bien1 as NSNumber) ?? "n/a"
            kq3.text? = ""
            }}
        lbdau.text = fndau
        codaucham = true
        xoadong = 2
    }
    func fndaukq (bkq:Double){
        bien1 = bienkq
        bienkq = bkq
        tinhtiep = true
        cobien1 = false
        provl = true
        xoadong = 4
    }
    
}

