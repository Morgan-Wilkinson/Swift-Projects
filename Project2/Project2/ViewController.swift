//
//  ViewController.swift
//  Project2
//
//  Created by Morgan Wilkinson on 4/14/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]();
    var score = 0;
    var correctAnswer = 0;
    var numberOfQuestions = 0;
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"];
        
        button1.layer.borderWidth = 1;
        button2.layer.borderWidth = 1;
        button3.layer.borderWidth = 1;
        
        button1.layer.borderColor = UIColor.lightGray.cgColor;
        button2.layer.borderColor = UIColor.lightGray.cgColor;
        button3.layer.borderColor = UIColor.lightGray.cgColor;
        
        askQuestion();
    }

    func askQuestion(action: UIAlertAction! = nil)
    {
        countries.shuffle();
        correctAnswer = Int.random(in: 0...2);
        
        button1.setImage(UIImage(named: countries[0]), for: .normal);
        button2.setImage(UIImage(named: countries[1]), for: .normal);
        button3.setImage(UIImage(named: countries[2]), for: .normal);
        
        title = "\(countries[correctAnswer].uppercased()) - Score:\(score)";
    }

    @IBAction func buttonTapped(_ sender: UIButton)
    {
        var title: String;
        
        if sender.tag == correctAnswer
        {
            title = "Correct!";
            score += 1;
            numberOfQuestions += 1;
        }
        else
        {
            title = "Wrong!";
            score -= 1;
            numberOfQuestions += 1;
        }
        
        if numberOfQuestions == 10
        {
            let finalscore = UIAlertController.init(title: "Final Score", message: "Your final score is \(score)", preferredStyle: .alert);
            finalscore.addAction(UIAlertAction(title: "Reset", style: .default, handler: askQuestion));
            score = 0;
            numberOfQuestions = 0;
            present(finalscore, animated: true);
        }
        
        if title == "Wrong!"
        {
            let ac = UIAlertController.init(title: title, message: "That's the flag of \(countries[sender.tag].uppercased()). Your score is \(score)", preferredStyle: .alert);
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion));
            present(ac, animated: true);
        }
       else
        {
            let ac = UIAlertController.init(title: title, message: "Your score is \(score)", preferredStyle: .alert);
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion));
            present(ac, animated: true);
        }
        
        
       
    }
}

