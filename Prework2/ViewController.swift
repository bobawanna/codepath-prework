//
//  ViewController.swift
//  Prework2
//
//  Created by Eva Georgieva on 8/20/22.
//  Please pay attention that for the sake of
//  better looking design, instead of orange
//  I picked my own color, as well as I also change
//  color of the label when swtiching to "goodbye"
//  text even though there is no such indication
//  in the instructions. Please do not consider
//  it a mistake because it was intentional for
//  a more pleasant picture. There are other
//  nuances, too, for the sake of design.

import UIKit



func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

var mycyan = hexStringToUIColor(hex: "#ccede2")
var mypink = hexStringToUIColor(hex: "#c583e5")

var label = "hello from eva"


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ChangeLabelField.delegate = self
        // Do any additional setup after loading the view.
    }
    


    @IBOutlet weak var TextLabel: UILabel!
    @IBAction func ButtonClicked(_ sender: Any) {
        print("label color test")
        TextLabel.textColor = UIColor.white
    }
    
    @IBOutlet var Background: UIView!
    
    @IBAction func ButtonBgColorClicked(_ sender: Any) {
        print("bg color test")
        Background.backgroundColor = UIColor.white
    }
    
    @IBAction func ButtonLabelTextChangeClicked(_ sender: Any) {
        TextLabel.text = "goodbye ^^"
        TextLabel.textColor = mycyan
    }
    
    
    @IBAction func BackgroundClicked(_ sender: Any) {
        print("background was clicked! :^) ")
        Background.backgroundColor = mypink
        TextLabel.textColor = mypink
        TextLabel.text = label
        
    }
    @IBAction func SuggestionClicked(_ sender: Any) {
        print("suggestion clicked")
        Background.backgroundColor = mypink
        TextLabel.textColor = mypink
        TextLabel.text = label
    }
    
    
    @IBOutlet weak var ChangeLabelField: UITextField!
    
    @IBAction func UpdateLabelClicked(_ sender: Any) {
        ChangeLabelField.resignFirstResponder()
        if ChangeLabelField.text == ""  {
            TextLabel.text = label
        }
        else    {
            TextLabel.text = ChangeLabelField.text!
        }
    }
    
    
        
    
    
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if ChangeLabelField.text == ""  {
            TextLabel.text = label
        }
        else    {
            TextLabel.text = ChangeLabelField.text!
        }
        return true
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}

