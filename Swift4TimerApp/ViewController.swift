//
//  ViewController.swift
//  Swift4TimerApp
//
//  Created by AdminAir on 2018/01/08.
//  Copyright © 2018年 ryotakahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var _timer: Timer?
    var _duration = 0
    let _settingKey = "timerValue"

    @IBOutlet weak var _startOrStopButton: UIButton!
    @IBOutlet weak var _resetButton: UIButton!
    @IBOutlet weak var _timerLabel: UILabel!
    
    //　アプリ起動時のみ
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = UserDefaults.standard
        settings.register(defaults: [_settingKey: 60])
        _resetButton.isEnabled = false
    }
    
    // 画面遷移するたび呼ばれる
    override func viewDidAppear(_ animated: Bool) {
        _duration = 0
        _ = displayUpdate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 時間設定画面を開く処理
    @IBAction func showSettingView(_ sender: Any) {
        if let nowTimer = _timer {
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
            performSegue(withIdentifier: "openSetting", sender: nil)
        }
    }
    
    // タイマーをスタート or 一時停止する処理
    @IBAction func onStartOrStopButton(_ sender: Any) {
        
        // タイマー初起動時
        if _timer == nil {
            startTimer()
            _startOrStopButton.setTitle("一時停止", for: .normal)
            _resetButton.isEnabled = false
            return
        }
        
        // タイマーの状態を確認して処理振り分け
        if _timer?.isValid == true {
            // スタート状態から一時停止に切り替える
            // 一時停止させて、ラベルを一時停止に変更
            _timer?.invalidate()
            _startOrStopButton.setTitle("スタート", for: .normal)
            _resetButton.isEnabled = true
        }else{
            // 一時停止状態からスタート状態に切り替える
            // タイマーをスタートし、ラベルをスタートに変更
            startTimer()
            _startOrStopButton.setTitle("一時停止", for: .normal)
            _resetButton.isEnabled = false
            
        }
        
    }
    
    // タイマーをリセットする処理
    @IBAction func onResetButton(_ sender: Any) {
        guard _timer != nil else {
            return
        }
        
        // 一時停止状態かどうか確認する
        if _timer?.isValid == true {
            // カウント中はリセットできないようにする
            return
        }
        
        // 一時停止中の場合
        // リセットボタン無効化
        _resetButton.isEnabled = false
        // 一時停止ボタンのラベルをスタートに戻す
        _startOrStopButton.setTitle("スタート", for: .normal)
        _startOrStopButton.isEnabled = true
        // 経過時間のリセット
        _duration = 0
        // タイマー無効化
        _timer?.invalidate()
        // 表示更新
        _ = displayUpdate()
        
    }
    
    func displayUpdate() -> Int {
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: _settingKey)
        // 残りの秒数
        let remainSeconds = timerValue - _duration
        
        _timerLabel.text = "あと\(remainSeconds)秒"
        return remainSeconds
    }
    
    
    func startTimer(){
        // タイマー作成 or スタート
        // 1.0秒ずつ　selectorで指定したメソッドを実行する
        _timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerStop(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func timerStop(_ timer:Timer){
        // 時間経過
        _duration += 1
        if displayUpdate() <= 0 {
            _duration = 0
            timer.invalidate()
            _startOrStopButton.isEnabled = false
            _resetButton.isEnabled = true
        }
    }
    
    
}

