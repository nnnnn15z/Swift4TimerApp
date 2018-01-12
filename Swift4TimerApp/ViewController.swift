//
//  ViewController.swift
//  Swift4TimerApp
//
//  Created by AdminAir on 2018/01/08.
//  Copyright © 2018年 ryotakahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?
    var duration = 0
    let settingKey = "timerValue"

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = UserDefaults.standard
        settings.register(defaults: [settingKey: 60])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var timeDisplay: UILabel!
    
    // 時間設定画面を開く処理
    @IBAction func showSettingView(_ sender: Any) {
        
    }
    // タイマーをスタートする処理
    @IBAction func startTimer(_ sender: Any) {
        
    }
    
    // タイマーをストップする処理
    @IBAction func stopTimer(_ sender: Any) {
        
    }
    
    func displayUpdate() -> Int {
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        let remainSeconds = timerValue - duration
        
        timeDisplay.text = "あと\(remainSeconds)秒"
        return remainSeconds
    }
    
}

