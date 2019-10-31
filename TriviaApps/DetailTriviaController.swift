//
//  DetailTriviaController.swift
//  TriviaApps
//
//  Created by DSMacbook on 28/10/19.
//  Copyright © 2019 DSMacbook. All rights reserved.
//

import UIKit
import Alamofire
class DetailTriviaController: UIViewController {
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var titleQuestion: UILabel!
    
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    @IBOutlet weak var questionAll: UILabel!
    @IBOutlet weak var questionCurrent: UILabel!
    
    
    var name = "";
    var trivia : [Trivia]!
    
    var currentQuestion = 0
    
    var btnsArray = [UIButton]()
    var grade = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitleLabel.text = name
        loadDatas(label: detailTitleLabel)
        answerButton1.layer.cornerRadius = answerButton1.frame.size.width/2
        answerButton1.layer.masksToBounds = true
        answerButton2.layer.cornerRadius = answerButton1.frame.size.width/2
        answerButton2.layer.masksToBounds = true
        answerButton3.layer.cornerRadius = answerButton1.frame.size.width/2
        answerButton3.layer.masksToBounds = true
        answerButton4.layer.cornerRadius = answerButton1.frame.size.width/2
        answerButton4.layer.masksToBounds = true
        
       
        
        
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func btnAnswers1Act(_ sender: Any) {
        selectAnswer(0)
    }
    
    @IBAction func btnAnswers2Act(_ sender: Any) {
        selectAnswer(1)
    }
    
    @IBAction func btnAnswers3Act(_ sender: Any) {
        selectAnswer(2)
    }
    
    @IBAction func btnAnswers4Act(_ sender: Any) {
        selectAnswer(3)
    }
    
    @IBAction func nextAct(_ sender: Any) {
        nextQuestion()
    }
    func loadDatas(label: UILabel){
        var category: String = "";
        if(label.text == "Entertaiment: Games"){
            category = "15"
            loadTrivia(category: category)
        }else if(label.text == "Entertaiment: Film"){
            category = "11"
            loadTrivia(category: category)
        }else if(label.text == "Computer Science"){
            category = "18"
            loadTrivia(category: category)
        }else if(label.text == "General Knowledge"){
            category = "9"
            loadTrivia(category: category)
        }else if(label.text == "Entertaiment: Music"){
            category = "12"
            loadTrivia(category: category)
        }else if(label.text == "Entertaiment: TV"){
            category = "14"
            loadTrivia(category: category)
        }
    }
    
    func loadTrivia(category: String){
        
        Alamofire.request("https://opentdb.com/api.php?amount=10&category=\(category)&difficulty=easy&type=multiple", method: .get,encoding: JSONEncoding.default, headers: nil).responseJSON {
                           response in
        //                   print(response)
                           switch response.result {
                           case .success:
                            if let json = response.result.value as? [String:Any] {
                                let jsonArray = json["results"] as? [[String: Any]]
                                var category1 = jsonArray![0]["category"] as! String
                                var question1 = jsonArray![0]["question"] as! String
                                var correct_answer1 = jsonArray![0]["correct_answer"] as! String
                                var incorrect_answer1 = jsonArray![0]["incorrect_answers"] as! [String]
                                incorrect_answer1.append(correct_answer1)
                                var category2 = jsonArray![1]["category"] as! String
                                var question2 = jsonArray![1]["question"] as! String
                                var correct_answer2 = jsonArray![1]["correct_answer"] as! String
                                var incorrect_answer2 = jsonArray![1]["incorrect_answers"] as! [String]
                                incorrect_answer2.append(correct_answer2)
                                var category3 = jsonArray![2]["category"] as! String
                                var question3 = jsonArray![2]["question"] as! String
                                var correct_answer3 = jsonArray![2]["correct_answer"] as! String
                                var incorrect_answer3 = jsonArray![2]["incorrect_answers"] as! [String]
                                incorrect_answer3.append(correct_answer3)
                                var category4 = jsonArray![3]["category"] as! String
                                var question4 = jsonArray![3]["question"] as! String
                                var correct_answer4 = jsonArray![3]["correct_answer"] as! String
                                var incorrect_answer4 = jsonArray![3]["incorrect_answers"] as! [String]
                                incorrect_answer4.append(correct_answer4)
                                var category5 = jsonArray![4]["category"] as! String
                                var question5 = jsonArray![4]["question"] as! String
                                var correct_answer5 = jsonArray![4]["correct_answer"] as! String
                                var incorrect_answer5 = jsonArray![4]["incorrect_answers"] as! [String]
                                incorrect_answer5.append(correct_answer5)
                                var category6 = jsonArray![5]["category"] as! String
                                var question6 = jsonArray![5]["question"] as! String
                                var correct_answer6 = jsonArray![5]["correct_answer"] as! String
                                var incorrect_answer6 = jsonArray![5]["incorrect_answers"] as! [String]
                                incorrect_answer6.append(correct_answer6)
                                var category7 = jsonArray![6]["category"] as! String
                                var question7 = jsonArray![6]["question"] as! String
                                var correct_answer7 = jsonArray![6]["correct_answer"] as! String
                                var incorrect_answer7 = jsonArray![6]["incorrect_answers"] as! [String]
                                incorrect_answer7.append(correct_answer7)
                                var category8 = jsonArray![7]["category"] as! String
                                var question8 = jsonArray![7]["question"] as! String
                                var correct_answer8 = jsonArray![7]["correct_answer"] as! String
                                var incorrect_answer8 = jsonArray![7]["incorrect_answers"] as! [String]
                                incorrect_answer8.append(correct_answer8)
                                var category9 = jsonArray![8]["category"] as! String
                                var question9 = jsonArray![8]["question"] as! String
                                var correct_answer9 = jsonArray![8]["correct_answer"] as! String
                                var incorrect_answer9 = jsonArray![8]["incorrect_answers"] as! [String]
                                incorrect_answer9.append(correct_answer9)
                                var category10 = jsonArray![9]["category"] as! String
                                var question10 = jsonArray![9]["question"] as! String
                                var correct_answer10 = jsonArray![9]["correct_answer"] as! String
                                var incorrect_answer10 = jsonArray![9]["incorrect_answers"] as! [String]
                                incorrect_answer10.append(correct_answer10)
                                
                               
//                                print(category,question1,correct_answer1,incorrect_answer1)
                                self.loadQuestion(category1: category1, question1: question1, correct_answers1: correct_answer1, incorrect_answers1: incorrect_answer1, category2: category2, question2: question2, correct_answers2: correct_answer2, incorrect_answers2: incorrect_answer2, category3: category3, question3: question3, correct_answers3: correct_answer3, incorrect_answers3: incorrect_answer3, category4: category4, question4: question4, correct_answers4: correct_answer4, incorrect_answers4: incorrect_answer4, category5: category5, question5: question5, correct_answers5: correct_answer5, incorrect_answers5: incorrect_answer5, category6: category6, question6: question6, correct_answers6: correct_answer6, incorrect_answers6: incorrect_answer6, category7: category7, question7: question7, correct_answers7: correct_answer7, incorrect_answers7: incorrect_answer7, category8: category8, question8: question8, correct_answers8: correct_answer8, incorrect_answers8: incorrect_answer8, category9: category9, question9: question9, correct_answers9: correct_answer9, incorrect_answers9: incorrect_answer9, category10: category10, question10: question10, correct_answers10: correct_answer10, incorrect_answers10: incorrect_answer10)
    //                                for datass in stride(from: 0, to: jsonarray.count, by: 1){
    //                                    var category: String = jsonarray[datass]["category"] as! String
    //                                    var type: String = jsonarray[datass]["difficulty"] as! String
    //                                    var difficulty: String = jsonarray[datass]["category"] as! String
    //                                    var question: String = jsonarray[datass]["question"] as! String
    //                                    var correct_answer: String = jsonarray[datass]["correct_answer"] as! String
    //                                    let jsonIncorrectAnswers = jsonarray[datass]["incorrect_answers"] as! [String]
    //                                    for jsonIncorrect in stride(from: 0, to: jsonIncorrectAnswers.count, by: 1){
    //                                        print(jsonIncorrectAnswers[jsonIncorrect])
    //                                    }
    //
    //
    //
    //                                    Trivia.init(category, type, difficulty, question, correct_answer, jsonIncorrectAnswers)
    //
    //                                }
                                    
                                
                            }
                           case .failure(let error):
                               print(error)
                           }
                }
    }
    func loadQuestion(category1: String,question1: String,correct_answers1: String,incorrect_answers1: [String],category2: String,question2: String,correct_answers2: String,incorrect_answers2: [String],category3: String,question3: String,correct_answers3: String,incorrect_answers3: [String],category4: String,question4: String,correct_answers4: String,incorrect_answers4: [String],category5: String,question5: String,correct_answers5: String,incorrect_answers5: [String],category6: String,question6: String,correct_answers6: String,incorrect_answers6: [String],category7: String,question7: String,correct_answers7: String,incorrect_answers7: [String],category8: String,question8: String,correct_answers8: String,incorrect_answers8: [String],category9: String,question9: String,correct_answers9: String,incorrect_answers9: [String],category10: String,question10: String,correct_answers10: String,incorrect_answers10: [String]){
//        let randomIndex1 = Int(arc4random_uniform(UInt32(incorrect_answers1.count)))
//        let randomIndex2 = Int(arc4random_uniform(UInt32(incorrect_answers2.count)))
//        let randomIndex3 = Int(arc4random_uniform(UInt32(incorrect_answers3.count)))
//        let randomIndex4 = Int(arc4random_uniform(UInt32(incorrect_answers4.count)))
//        let randomIndex5 = Int(arc4random_uniform(UInt32(incorrect_answers5.count)))
//        let randomIndex6 = Int(arc4random_uniform(UInt32(incorrect_answers6.count)))
//        let randomIndex7 = Int(arc4random_uniform(UInt32(incorrect_answers7.count)))
//        let randomIndex8 = Int(arc4random_uniform(UInt32(incorrect_answers8.count)))
//        let randomIndex9 = Int(arc4random_uniform(UInt32(incorrect_answers9.count)))
//        let randomIndex10 = Int(arc4random_uniform(UInt32(incorrect_answers10.count)))
        
        
        let loadQuestion1 = Trivia.init("", "", "", question1, correct_answers1, incorrect_answers1.shuffled())
        let loadQuestion2 = Trivia.init("", "", "", question2, correct_answers2, incorrect_answers2.shuffled())
        let loadQuestion3 = Trivia.init("", "", "", question3, correct_answers3, incorrect_answers3.shuffled())
        let loadQuestion4 = Trivia.init("", "", "", question4, correct_answers4, incorrect_answers4.shuffled())
        let loadQuestion5 = Trivia.init("", "", "", question5, correct_answers1, incorrect_answers5.shuffled())
        let loadQuestion6 = Trivia.init("", "", "", question6, correct_answers1, incorrect_answers6.shuffled())
        let loadQuestion7 = Trivia.init("", "", "", question7, correct_answers7, incorrect_answers7.shuffled())
        let loadQuestion8 = Trivia.init("", "", "", question8, correct_answers1, incorrect_answers8.shuffled())
        let loadQuestion9 = Trivia.init("", "", "", question9, correct_answers1, incorrect_answers9.shuffled())
        let loadQuestion10 = Trivia.init("", "", "", question10, correct_answers10, incorrect_answers10.shuffled())
        self.trivia = [
            loadQuestion1,
            loadQuestion2,
            loadQuestion3,
            loadQuestion4,
            loadQuestion5,
            loadQuestion6,
            loadQuestion7,
            loadQuestion8,
            loadQuestion9,
            loadQuestion10
            
        ]
        showQuestion(0)
    }
    
    
    func showQuestion(_ questionId : Int) -> Void {
        enableButtons()
        
        let selectedQuestion : Trivia = trivia[questionId]
        
        
        questionLabel.text = selectedQuestion.question.replacingOccurrences(of: "&#;1234567890<[^>]+>"+"\"", with: "", options: .regularExpression, range: nil)
        questionCurrent.text = "Question No. \(questionId+1)"
        questionAll.text = "Question No. \(questionId+1) / 10"
        
        self.questionLabel.lineBreakMode = .byClipping
        self.questionLabel.lineBreakMode = .byCharWrapping
//        textAnswer1.text = selectedQuestion.incorrect_answer[0]
//        textAnswer2.text = selectedQuestion.incorrect_answer[1]
//        textAnswer3.text = selectedQuestion.incorrect_answer[2]
//        textAnswer4.text = selectedQuestion.correct_answer
        answerButton1.titleLabel?.lineBreakMode = .byClipping
        answerButton2.titleLabel?.lineBreakMode = .byClipping
        answerButton3.titleLabel?.lineBreakMode = .byClipping
        answerButton4.titleLabel?.lineBreakMode = .byClipping
        answerButton1.titleLabel?.lineBreakMode = .byCharWrapping
        answerButton2.titleLabel?.lineBreakMode = .byCharWrapping
        answerButton3.titleLabel?.lineBreakMode = .byCharWrapping
        answerButton4.titleLabel?.lineBreakMode = .byCharWrapping
        
        answerButton1.setTitle(selectedQuestion.incorrect_answer[0], for: UIControl.State())
        answerButton2.setTitle(selectedQuestion.incorrect_answer[1], for: UIControl.State())
        answerButton3.setTitle(selectedQuestion.incorrect_answer[2], for: UIControl.State())
        answerButton4.setTitle(selectedQuestion.incorrect_answer[3], for: UIControl.State())
    }
    
    func disableButtons() -> Void {
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        questionLabel.isHidden = true
    }
    
    func enableButtons() -> Void {
        answerButton1.isEnabled = true
        answerButton2.isEnabled = true
        answerButton3.isEnabled = true
        answerButton4.isEnabled = true
        questionLabel.isHidden = false
    }
    
    func selectAnswer(_ answerId : Int) -> Void {
        disableButtons()
        
        let answer : Trivia = trivia[currentQuestion]
        
        btnsArray = [answerButton1, answerButton2, answerButton3, answerButton4]
        let correct_answers = answer.incorrect_answer[answerId]
       
            if(correct_answers == answer.correct_answer){
                btnsArray[answerId].backgroundColor = UIColor.green
                grade += 1
            }else{
                btnsArray[answerId].backgroundColor = UIColor.red
                if(answer.correct_answer == answerButton1.titleLabel?.text){
                    answerButton1.backgroundColor = UIColor.green
                    print(answer.correct_answer,answerButton1.titleLabel?.text)
                }else if(answer.correct_answer == answerButton2.titleLabel?.text){
                    answerButton2.backgroundColor = UIColor.green
                     print(answer.correct_answer,answerButton2.titleLabel?.text)
                }else if(answer.correct_answer  == answerButton3.titleLabel?.text){
                    answerButton3.backgroundColor = UIColor.green
                     print(answer.correct_answer,answerButton3.titleLabel?.text)
                }else{
                    answerButton4.backgroundColor = UIColor.green
                     print(answer.correct_answer,answerButton4.titleLabel?.text)
                }
            }
        }
        
        
        
        
//      viewFeddback.isHidden = false
    
    
    func nextQuestion() {
        currentQuestion += 1
        answerButton1.backgroundColor = UIColor(named: "card")
        answerButton2.backgroundColor = UIColor(named: "card")
        answerButton3.backgroundColor = UIColor(named: "card")
        answerButton4.backgroundColor = UIColor(named: "card")
        if (currentQuestion < trivia.count) {
            showQuestion(currentQuestion)
        }else{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            newViewController.grade = String(grade)
            self.present(newViewController, animated: true, completion: nil)
            
            
            
           
        }
    }
    
    
}










