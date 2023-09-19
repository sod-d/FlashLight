//
//  ViewController.swift
//  Flashlight
//
//  Created by 김소영 on 2023/09/18.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //IB interface Builder 의 약자
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var flashImageView: UIImageView!
    var switchSound: AVAudioPlayer?
    
    //현재 꺼져있는지 아닌지
    var isOn = false
    
    override func viewDidLoad() { //메모리에 로드가 될 때 호출되는 함수
        super.viewDidLoad()
        
        playSound();

    }
    func playSound(){
        let path = Bundle.main.path(forResource: "switch.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            switchSound = try AVAudioPlayer(contentsOf: url)
            switchSound?.prepareToPlay() //미리 메모리에 로드 해놓고 불러오는 함수
        } catch {
            // couldn't load file :(
        }
    }
    //버튼을 눌렀을 경우의 이벤트
    @IBAction func switchTapped(_ sender: Any) {
        isOn = !isOn
        switchSound?.play()
//        아래 내용과 동일한 동작임
//        if isOn == true
//        {
//            switchButton.setImage(UIImage(named: "onSwitch"), for: .normal)
//            flashImageView.image = UIImage(named: "onBG")
//        }
//        else
//        {
//            switchButton.setImage(UIImage(named: "offSwitch"), for: .normal)
//            flashImageView.image = UIImage(named: "offBG")
//        }
        
        switchButton.setImage(UIImage(named: isOn ? "onSwitch" : "offSwitch"), for: .normal)
        flashImageView.image = isOn ? UIImage(named: "onBG") : UIImage(named: "offBG")
    }
    
}

