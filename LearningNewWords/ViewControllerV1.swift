//
//  ViewControllerV1.swift
//  LearningNewWords
//
//  Created by user on 25.01.2022.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewControllerV1: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextWordButton(_ sender: UIButton) {
        next(dictionary: dictionary)
    }
    
    //Словарь в котором находятся слова и перевод.
    var  dictionary: [String:String] = ["Кот":"Cat", "Собака":"Dog","Рыба":"Fish"]
    var dictionaryWrongs: [String: String] = [:]
    //Переменные для временного хранения значения словоря
    var checkValue: String = ""
    
    var checkValueSecond: String = ""
    var countCheck = 0
    var textInd: [String] = []
    var counter: Int = 0
    var countRs: String = ""
    func dsad(){
        self.textInd.removeAll()
        
        for _ in 1...dictionary.count {
            
//        let text: String = "⚪️"
            self.textInd.append("⚪️")
            
        }
       
        indicatorLabel.text = textInd.joined(separator:"")
    }
   
    
    //Индекаторы
    @IBOutlet weak var indicatorLabel: UILabel!
    @IBOutlet weak var numIndicator: UILabel!
    @IBOutlet weak var maxNumIndicator: UILabel!
    
    
    @IBAction func printButton(_ sender: Any) {
        statusLable.text = ("dictionary = \(dictionary); ValueNow: \(checkValueSecond) or \(checkValue)")
    }
    @IBOutlet weak var statusLable: UILabel!
    
    
    //Кнопка которая добавит повторно содержимое в словарь
    @IBAction func addButton(_ sender: UIButton) {
        dictionary = ["Кот":"Cat", "Собака":"Dog","Рыба":"Fish"]
        print (dictionary)
        print (checkValueSecond)
        
    }
    
    //Функция для проверки ответа
    func start(One: Dictionary<String, String>){
        countCheck = 0
        numIndicator.text = String(counter)
        if dictionary == [:] {
            resultLabel.text = "Словарь пуст"
            wordLabel.text = ""
        } else {
            dsad()
            let index: Int = Int(arc4random_uniform(UInt32(One.count)))
            
            let randomKay = Array(dictionary.keys)[index]
            let randomVal = Array(dictionary.values)[index]
            print (index, randomKay, randomVal)
            wordLabel.text = randomKay
            
            dictionary[randomKay] = nil
            print (dictionary)
            checkValue = randomVal
        }
    }
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    //Кнопка для старта
    @IBAction func startButton(_ sender: UIButton) {
        AudioServicesPlaySystemSound(SystemSoundID(1104))
        if dictionary != [:]{
            maxNumIndicator.text = String(dictionary.count)
            counter = 1
            
            numIndicator.text = String(counter)
        }
        
        start(One: dictionary)
        
    }
    
    //Алерт сообщение
    func alert() {
        let message = UIAlertController(title: "Сообщение", message: "Слов больше нет или это ошибка в коде", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            print("Ok button tapped")
        }
        message.addAction(ok)
        self.present(message, animated: .random(), completion: nil)
    }
    
    func checkNotNext() {
     
        if textField.text == "" {
            resultLabel.text = "Введите перевод"
        } else if textField.text == checkValue {
            resultLabel.text = "Верно"
            resultLabel.textColor = .green
            textInd[countCheck] = "🟢"
            indicatorLabel.text = textInd.joined(separator: "")
            print (dictionary[checkValue])
            
        } else {
            resultLabel.text = "Не верно"
            resultLabel.textColor = .red
            textInd[countCheck] = "🔴"
            indicatorLabel.text = textInd.joined(separator: "")
            
        }
    }
    
    func next(dictionary: Dictionary<String, String>){
        resultLabel.text = "Результат"
        resultLabel.textColor = .black
        textField.text = ""
        if dictionary == [:]{
            resultLabel.text = "Словарь пуст"
            wordLabel.text = ""
            counter = 0
            numIndicator.text = String(counter)
            maxNumIndicator.text = "0"
            textInd = []
            indicatorLabel.text = textInd.joined(separator: "")
        } else {
            counter+=1
            countCheck+=1
            numIndicator.text =  String(counter)
            checkValue = ""
            let index: Int = Int(arc4random_uniform(UInt32(dictionary.count)))
            
            let randomKay = Array(dictionary.keys)[index]
            let randomVal = Array(dictionary.values)[index]
            print (index, randomKay, randomVal)
            wordLabel.text = randomKay
            
            self.dictionary[randomKay] = nil
            print (dictionary)
            checkValue = randomVal
        }
        
    }
 
    
    @IBAction func checkButton(_ sender: Any) {
        AudioServicesPlaySystemSound(SystemSoundID(1104))
//        check()
        checkNotNext()
    }
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    //Add new
    @IBOutlet weak var addWordFieldFirst: UITextField!
    
    @IBOutlet weak var addWordFieldSecond: UITextField!
    
    @IBAction func addNewWordsButton(_ sender: UIButton) {
        let firstWord = String(self.addWordFieldFirst.text!)
        let secondWord = String(self.addWordFieldSecond.text!)
        self.dictionary[firstWord] = secondWord
        //        self.array.append(firstWord)
        //        self.wordLabel.text = addWordFieldFirst.text
        print(dictionary)
        self.addWordFieldFirst.text = ""
        self.addWordFieldSecond.text = ""
        maxNumIndicator.text = String(dictionary.count)
    }
    
//    //Функция для проверки ответов
//    func check() {
//        if dictionary == [:] || textField.text == "" {
//            wordLabel.text = "No"
//            resultLabel.text = "Слов больше нет"
//            textField.text = ""
//            alert()
//            numIndicator.text = "0"
//
//
//
//        } else if textField.text == checkValue || textField.text == checkValueSecond {
//            resultLabel.text = "Верно"
//            resultLabel.textColor = .green
//
//            if dictionary == [:]  {
//                wordLabel.text = "No"
//            } else {
//                textField.text = ""
//                print(dictionary)
//                checkValue = ""
//                checkValueSecond = ""
//                let index: Int = Int(arc4random_uniform(UInt32(dictionary.count)))
//                let randomKay = Array(dictionary.keys)[index]
//                let randomVal = Array(dictionary.values)[index]
//                dictionary[randomKay] = nil
//                wordLabel.text = randomKay
//                checkValueSecond = randomVal
//                let test = indicatorLabel.text
//                indicatorLabel.text = "\(test ?? "")🟢"
//                let num: Int = Int(numIndicator.text!)! + 1
//                numIndicator.text = String(num)
//
//            }
//
//        } else {
//            resultLabel.text = "Не верно"
//            resultLabel.textColor = .red
//            checkValue = ""
//            checkValueSecond  = ""
//            let index: Int = Int(arc4random_uniform(UInt32(dictionary.count)))
//            let randomKay = Array(dictionary.keys)[index]
//            let randomVal = Array(dictionary.values)[index]
//            dictionary[randomKay] = nil
//            wordLabel.text = randomKay
//            checkValueSecond = randomVal
//            let test = indicatorLabel.text
//            indicatorLabel.text = "\(test ?? "")🔴"
//            let num: Int = Int(numIndicator.text!)! + 1
//            numIndicator.text = String(num)
//        }
//
//
//    }
}


