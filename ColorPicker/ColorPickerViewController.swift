//
//  ColorPickerViewController.swift
//  ColorPicker
//
//  Created by Axel Le Bot on 01/12/2016.
//  Copyright © 2016 Axel Le Bot. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController{
    var delegate: ColorPickerViewDelegate!
    
    @IBOutlet weak var colorPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pickerView(colorPicker, didSelectRow: 0, inComponent: 0)
    }
    
    func setBackGroundColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    func getNegative(color: UIColor) -> UIColor {
        let redNegative: Float = Float(1) - Float(color.cgColor.components![0])
        let greenNegative: Float = Float(1) - Float(color.cgColor.components![1])
        let blueNegative: Float = Float(1) - Float(color.cgColor.components![2])
        return UIColor(red: CGFloat(redNegative), green: CGFloat(greenNegative), blue: CGFloat(blueNegative), alpha: CGFloat(1))
    }
    
    func getColorFromPicker() -> UIColor {
        let redFromPicker: Float = Float(colorPicker.selectedRow(inComponent: 0))/255.0
        let greenFromPicker: Float = Float(colorPicker.selectedRow(inComponent: 1))/255.0
        let blueFromPicker: Float = Float(colorPicker.selectedRow(inComponent: 2))/255.0
        return UIColor(red: CGFloat(redFromPicker),
                       green: CGFloat(greenFromPicker),
                       blue: CGFloat(blueFromPicker),
                       alpha: CGFloat(1.0))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate.userDidChooseColor(color: getColorFromPicker())
    }
}

protocol ColorPickerViewDelegate{
    func userDidChooseColor(color: UIColor)
}

extension ColorPickerViewController: UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 256
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
}

extension ColorPickerViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.setBackGroundColor(color: self.getColorFromPicker())
        })
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let myString = String(row)
        return NSAttributedString(string: myString, attributes: [NSForegroundColorAttributeName:getNegative(color: getColorFromPicker())])
    }
}

