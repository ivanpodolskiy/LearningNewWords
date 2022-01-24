//
//  ViewController.swift
//  LearningNewWords
//
//  Created by user on 24.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var addWordFieldFirst: UITextField!
    
    @IBOutlet weak var addWordFieldSecond: UITextField!
    
    @IBOutlet weak var wordLabel: UILabel!
    
    var  dictionary: [String:String] = ["Кот":"Cat", "Собака":"Dog","Рыба":"Fish"]
    var array: [String] = []
    
    //Добавляем слова с переводом в словарь
    @IBAction func addNewWordButton(_ sender: Any) {
        let firstWord = String(self.addWordFieldFirst.text!)
        let secondWord = String(self.addWordFieldSecond.text!)
        self.dictionary[firstWord] = secondWord
//        self.array.append(firstWord)
//        self.wordLabel.text = addWordFieldFirst.text
        print(dictionary)
        self.addWordFieldFirst.text = ""
        self.addWordFieldSecond.text = ""
        
//        print (dictionary[firstWord]!)
    }
    
    
    //Проверяет содержание dictionary
    @IBAction func test(_ sender: Any) {
        dictionary = ["Кот":"Cat", "Собака":"Dog","Рыба":"Fish"]
        for i in dictionary {
            print("key: \(i.key). Value: \(i.value)")

//          CheckField.text = dictionary[]
        }
    }
    
    
    @IBAction func start(_ sender: Any) {
        for (key, value) in dictionary {
            wordLabel.text = key
        }
        
        
    }
    
    @IBOutlet weak var CheckField: UITextField!
    @IBOutlet weak var check: UILabel!
    @IBAction func checkButton(_ sender: Any) {
        
        let checkWord: String = String (CheckField.text ?? "Нажмите Start")

   
        for (key,value ) in dictionary  {
            if dictionary == [:] {
               print("Выходим из массива")
                self.check.text = "Слов больше нет"
                self.check.textColor = .black
                break
            } else {
                print ("if dictionary != [:]")
                print(key)
                wordLabel.text = key
                if checkWord == value {
                    self.check.text = "Правильно"
                    self.check.textColor = UIColor.green
                    dictionary[key] = nil
                  
                } else if checkWord == "" {
                    self.check.text = "Введите перевод"
                    self.check.textColor = .blue
                    break
                } else {
                    self.check.text = "Не верно"
                    self.check.textColor = UIColor.red
                }
                
            }
            
            
        
           
          print(dictionary)
        }
        
    }
}





