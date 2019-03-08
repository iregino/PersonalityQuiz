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
    var answersChosen: [Answer] = []
    
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
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSllider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    } // end viewDidLoad()
    
    // Capture user's answer to single answer question
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAsnwers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAsnwers[0])
        case singleButton2:
            answersChosen.append(currentAsnwers[1])
        case singleButton3:
            answersChosen.append(currentAsnwers[2])
        case singleButton4:
            answersChosen.append(currentAsnwers[3])
        default:
            break
        } // end switch {}
        
        nextQuestion()
    } // end singleAnswerButtonPress()
    
    // Capture user's answers to multi answer question
    @IBAction func mutliAnswerButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        } // end switch {}
        
        nextQuestion()
        
    } // end multiAnswerButtonPressed()

    // Capture user's answer to ranged answer question
    @IBAction func rangedAnswerButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSllider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
        
    } // end rangedAnswerButtonPressed()
    
    // Show next question. If final question, segue to results view
    func nextQuestion() {
        
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        } // end if
        
    } // end nextQuestion()

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
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
        
    } // end updateMultiStack()

    // Show ranged stack view and set labes with appropriate answers
    func updateRangedStack(using answers: [Answer]) {
        
        rangedStackView.isHidden = false
        rangedSllider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
        
    } // end updateRangedStack()
    
} // end QuestionViewController {}
