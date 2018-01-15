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
        _ = navigationController?.popViewController(animated: true)
    }
    
    // データの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // データの個数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return valueArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(valueArray[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let settings = UserDefaults.standard
        settings.setValue(valueArray[row], forKey: settingKey)
        settings.synchronize()
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
