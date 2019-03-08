//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by student14 on 3/7/19.
//  Copyright © 2019 student14. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    // Variables
    var responses: [Answer]!
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        calculatePersonalityResult()
    
    } // end viewDidLoad()
    
    // Determine the personality of the user based on the answers to the questions
    func calculatePersonalityResult() {
        
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        } // end for-in loop
        
        // Determine which value is the largest by placing each pair into an array and sorting the value properties in descending order
        let frequencyAnswerSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        // Grab the animal type with the largest value
        let mostCommonAnswer = frequencyAnswerSorted.first!.key
        
        // Alternative to above code
        //  let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
    } // end calculatePersonalityResult()


}
