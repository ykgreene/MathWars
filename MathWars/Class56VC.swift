//
//  Class56VC.swift
//  MathWars
//
//  Created by Yashim Greene on 2/13/17.
//  Copyright © 2017 Yashim Greene. All rights reserved.
//

import UIKit
import AVFoundation

class Class56VC: UIViewController {

    //Variables
    var playerName = ["Zamora", "Rudy", "Rey", "Brandon", "Hector", "Bryan", "Nicholas", "Chris", "Lesvin", "Arianna", "Merayah", "Camila", "Michell", "Zoyla", "Luis", "Irene", "Jackie", "Francelly", "Julysa", "Desirey", "Martin", "Bri", "Saul", "Isaiah", "Angelina", "Tula", "Catilina", "Sandra", "Gabby", "Sarah", "Sergio"]

    var count: UInt32 = 31
    
    var alreadyRandomed=NSMutableArray()
    
    var seconds = 180
    var timer = Timer()
    var SoundPlayer1:AVAudioPlayer = AVAudioPlayer()
    var SoundPlayer2:AVAudioPlayer = AVAudioPlayer()
    var SoundPlayer3:AVAudioPlayer = AVAudioPlayer()
    var SoundPlayer4:AVAudioPlayer = AVAudioPlayer()
    var SoundPlayer5:AVAudioPlayer = AVAudioPlayer()
    
    //IBOutlets
    @IBOutlet weak var player1BTN: UIButton!
    @IBOutlet weak var player2BTN: UIButton!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var sliderCtrl: UISlider!
    
    func generateUnUsedRandomNumber1()->Int
    {
        var player1=Int(arc4random_uniform(count))
        
        if(alreadyRandomed.count==31)
        {
            alreadyRandomed.removeAllObjects()
        }
        
        if alreadyRandomed.contains(player1)
        {
            player1=generateUnUsedRandomNumber1()
        }
        else
        {
            alreadyRandomed.add(player1)
        }
        
        return player1
    }
    
    func generateUnUsedRandomNumber2()->Int
    {
        var player2=Int(arc4random_uniform(count))
        
        if(alreadyRandomed.count==31)
        {
            alreadyRandomed.removeAllObjects()
        }
        
        if alreadyRandomed.contains(player2)
        {
            player2=generateUnUsedRandomNumber2()
        }
        else
        {
            alreadyRandomed.add(player2)
        }
        
        return player2
    }
    
    //IBActions
    @IBAction func player1BTNpressed(_ sender: Any) {
        
        //Randomize player from 0 to 26
        let player1 = generateUnUsedRandomNumber1()
        print ("player 1", playerName[player1])
        
        // Change Button Title Text
        player1BTN.setTitle((playerName[player1]), for: UIControlState.normal)
        
        // Ensure that text will fit in button
        player1BTN.titleLabel?.minimumScaleFactor = 0.5
        player1BTN.titleLabel?.numberOfLines = 1
        player1BTN.titleLabel?.adjustsFontSizeToFitWidth = true
        
        //Play Audio
        SoundPlayer2.play()
    }
    
    
    
    @IBAction func player2BTNpressed(_ sender: Any) {
        
        //Randomize player from 0 to 26
        let player2 = generateUnUsedRandomNumber2()
        print ("player 2", playerName[player2])
        
        // Change Button Title Text
        player2BTN.setTitle((playerName[player2]), for: UIControlState.normal)
        
        // Ensure that text will fit in button
        player2BTN.titleLabel?.minimumScaleFactor = 0.5
        player2BTN.titleLabel?.numberOfLines = 1
        player2BTN.titleLabel?.adjustsFontSizeToFitWidth = true
        
        //Play Audio
        SoundPlayer2.play()
    }
    
    @IBAction func startBtnTapped(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
        SoundPlayer4.play()
        
        //Hide Start and Slider Buttons
        startBtn.isHidden = true
        sliderCtrl.isHidden = true
        stopBtn.isHidden = false
        
    }
    
    @IBAction func stopBtnTapped(_ sender: Any) {
        timer.invalidate()
        seconds = 180
        sliderCtrl.setValue(180, animated: true)
        timerLbl.text = "180"
        
        SoundPlayer3.play()
        
        //Show Start and Slider Buttons
        sliderCtrl.isHidden = false
        startBtn.isHidden = false
        stopBtn.isHidden = true
    }
    
    @IBAction func sliderCrtlUsed(_ sender: UISlider) {
        seconds = Int(sender.value)
        timerLbl.text = String(seconds)
    }
    
    // Source Code
    override func viewDidLoad() {
        super.viewDidLoad()
        //AVAudioPlayer
        let AudioFileLocation1 = Bundle.main.path(forResource: "Time's Over", ofType: "wav")
        let AudioFileLocation2 = Bundle.main.path(forResource: "Result2_r_01", ofType: "mp3")
        let AudioFileLocation3 = Bundle.main.path(forResource: "GameOver", ofType: "wav")
        let AudioFileLocation4 = Bundle.main.path(forResource: "The Battle Has Begun", ofType: "wav")
        let AudioFileLocation5 = Bundle.main.path(forResource: "A-Tone", ofType: "mp3")
        
        do {
            SoundPlayer1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: AudioFileLocation1!))
            SoundPlayer2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: AudioFileLocation2!))
            SoundPlayer3 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: AudioFileLocation3!))
            SoundPlayer4 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: AudioFileLocation4!))
            SoundPlayer5 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: AudioFileLocation5!))
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
            
        catch {
            print(error)
        }
    }
    
    //Functions and Methods
    func counter(){
        seconds -= 1
        timerLbl.text = String(seconds)
        
        if (seconds == 0){
            timer.invalidate()
            
            //Show Start and Slider Buttons
            startBtn.isHidden = false
            sliderCtrl.isHidden = false
            stopBtn.isHidden = true
            
            //Play Audio
            SoundPlayer1.play()
        }
        
        // 10 seconds left tone
        if seconds < 10 {
            
            SoundPlayer5.play()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
