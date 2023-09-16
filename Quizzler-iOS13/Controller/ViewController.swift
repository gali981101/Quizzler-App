//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBOutlet weak var a1Button: UIButton!
    @IBOutlet weak var a2Button: UIButton!
    @IBOutlet weak var a3Button: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        answerHandle(senderButton: sender)
    }
    
}


// MARK: Func

extension ViewController {
    
    private func answerHandle(senderButton: UIButton) {
        switchButtonColor(sender: senderButton)
        quizBrain.nextQuestion()
        updateUI()
    }
    
    private func switchButtonColor(sender: UIButton) {
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
    }
    
    private func updateUI() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            scoreLabel.text = "Score: \(quizBrain.getScore())"
            questionLabel.text = quizBrain.getQuestionText()
            
            buttonAppearHandle()
            
            progressBar.progress = quizBrain.getProgress()
        }
    }
    
    private func buttonAppearHandle() {
        answerUpdate()
        colorClear()
    }
    
    private func answerUpdate() {
        a1Button.setTitle(quizBrain.getAnswerText(0), for: .normal)
        a2Button.setTitle(quizBrain.getAnswerText(1), for: .normal)
        a3Button.setTitle(quizBrain.getAnswerText(2), for: .normal)
    }
    
    private func colorClear() {
        a1Button.backgroundColor = .clear
        a2Button.backgroundColor = .clear
        a3Button.backgroundColor = .clear
    }
    
}

