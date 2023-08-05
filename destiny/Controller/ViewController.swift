//
//  ViewController.swift
//  destiny
//
//  Created by Daria Arisova on 05.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Btn: UIButton!
    @IBOutlet weak var choice2Btn: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        sender.layer.opacity = 0.5
        
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        if storyBrain.isEndOfStory {
            let alert = UIAlertController(title: "Your story is over!", message: "Tap \"OK\" to reset storytelling", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            storyBrain.resetStory()
        }
        
        let currentStory = storyBrain.getCurrentStory()
        
        choice1Btn.layer.opacity = 1
        choice2Btn.layer.opacity = 1
        storyLabel.text = currentStory.title
        choice1Btn.setTitle(currentStory.choice1, for: .normal)
        choice2Btn.setTitle(currentStory.choice2, for: .normal)
    }
}

