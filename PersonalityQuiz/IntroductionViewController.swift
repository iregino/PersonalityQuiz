//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by student14 on 3/7/19.
//  Copyright © 2019 student14. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    } // end viewDidLoad()

    @IBAction func unwindToQuizIntro(unwindSegue: UIStoryboardSegue) {

    } // end unwindToQuizIntro

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        questions.shuffle()
    } // end viewWillAppear()
}

