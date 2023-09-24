//
//  ViewController.swift
//  Flashlight
//
//  Created by 윤태웅 on 2023/09/16.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var isOn = false
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let soundURL = Bundle.main.url(forResource: "Sound/switch", withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer.prepareToPlay()
            } catch {
                print("Error initializing AVAudioPlayer: \(error)")
            }
        } else {
            print("Sound file not found.")
        }
    }

    @IBAction func switchTapped(_ sender: Any) {
        isOn = !isOn
        audioPlayer.play()
        
        switchButton.setImage(isOn ? UIImage(named: "onSwitch") : UIImage(named: "offSwitch") , for: .normal)
        backgroundImage.image = isOn ? UIImage(named: "onBG") : UIImage(named: "offBG")
        
    }
    
}

