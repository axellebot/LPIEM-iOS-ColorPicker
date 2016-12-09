//
//  ViewController.swift
//  ColorPicker
//
//  Created by Axel Le Bot on 01/12/2016.
//  Copyright © 2016 Axel Le Bot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let SEGUE_SHOW_PICKER = "showPicker"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBackgroundColor(color: UIColor){
        view.backgroundColor = color
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == SEGUE_SHOW_PICKER) {
            let nextController : ColorPickerViewController = segue.destination as! ColorPickerViewController
            nextController.delegate = self
        }
    }
    
}

extension ViewController: ColorPickerViewDelegate{
    func userDidChooseColor(color: UIColor) {
        setBackgroundColor(color: color)
    }
}

