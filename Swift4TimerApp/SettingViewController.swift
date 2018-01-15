//
//  SettingViewController.swift
//  Swift4TimerApp
//
//  Created by AdminAir on 2018/01/08.
//  Copyright © 2018年 ryotakahashi. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var timerPicker: UIPickerView!
    let valueArray = [10,30,60,120,180]
    let settingKey = "timerValue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerPicker.delegate = self
        timerPicker.dataSource = self
        
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        for row in 0..<valueArray.count {
            if valueArray[row] == timerValue {
                timerPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func chooseAction(_ sender: Any) {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
