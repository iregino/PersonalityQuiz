//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by student14 on 3/7/19.
//  Copyright © 2019 student14. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    // Variable declaration
    var questionIndex = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    } // end viewDidLoad()
    
    // Show the question and answer choices to user
    func updateUI() {
        
        // Set all stack views hidden property to true
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)

        // Set the appropriate question number on the navigation title
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Determine the question type and show the appropriate view to user
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        } // end switch {}
        
    }
    
    // Show single stack view and set buttons with appropriate answers
    func updateSingleStack(using answers: [Answer]) {
        
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    } // end updateSingleStack()
    
    // Show multi stack view and set labels with appropriate answers
    func updateMultipleStack(using answers: [Answer]) {
        
        multipleStackView.isHidden = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    } // end updateMultiStack()

    // Show ranged stack view and set labes with appropriate answers
    func updateRangedStack(using answers: [Answer]) {
        
        rangedStackView.isHidden = false
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    } // end updateRangedStack()
}
