//
//  ViewController.swift
//  countdown
//
//  Created by Veronica Cheung on 12/8/2020.
//  Copyright © 2020 Veronica Cheung. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var seconds = 30
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func sliderUsed(_ sender: UISlider) {
        seconds = Int(sender.value)
        label.text = String(seconds) + " seconds"
    }
    
    @IBAction func startTimer(_ sender: Any) {
      //  let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true,   block: @escaping (Timer) -> Void) -> Timer;)
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        slider.isHidden = true
        startButton.isHidden = true
    }
    
    @objc func counter() {
        seconds -= 1
        label.text = String(seconds) + " seconds"
        
        if (seconds == 0){
            timer.invalidate()
         //   slider.isHidden = false
      //      startButton.isHidden = false
            
            audioPlayer.play()
        }
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
     //   timer = nil
        seconds = 30
        slider.setValue(30, animated: true)
        label.text = "30 seconds"
        
        audioPlayer.stop()
        
        slider.isHidden = false
        startButton.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            let audioPath = Bundle.main.path(forResource: "1", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf:URL(fileURLWithPath: audioPath!))
        }
        catch {
            //ERROR
        }
        // Do any additional setup after loading the view.
    }


}

