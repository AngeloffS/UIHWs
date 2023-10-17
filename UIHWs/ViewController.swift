//
//  ViewController.swift
//  UIHWs
//
//  Created by Сергей Ангелов on 17.10.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    //- MARK: Создание лейблов и кнопок
    
    private let greetingLabel = UILabel()
    private let resultAddLabel = UILabel()
    private let resultGuessLabel = UILabel()
    
    private func createViews() {
        
        //Кнопка сложения
        let addButton = UIButton(frame: CGRect(x: 35, y: 410, width: 150, height: 150))
        addButton.backgroundColor = .red
        addButton.setTitle("Сложение", for: .normal)
        addButton.layer.cornerRadius = 40
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        
        //Кнопка угадывания
        let guessButton = UIButton(frame: CGRect(x: 210, y: 410, width: 150, height: 150))
        guessButton.backgroundColor = .red
        guessButton.setTitle("Угадай число", for: .normal)
        guessButton.layer.cornerRadius = 40
        guessButton.addTarget(self, action: #selector(guessButtonAction), for: .touchUpInside)
        
        //Приветственный лейбл
        greetingLabel.frame = CGRect(x: 0, y: 70, width: 397, height: 40)
        greetingLabel.backgroundColor = .white
        greetingLabel.textColor = .black
        greetingLabel.textAlignment = .center
        
        //Лейбл результата сложения
        resultAddLabel.frame = CGRect(x: 35, y: 350, width: 150, height: 50)
        resultAddLabel.backgroundColor = .gray
        resultAddLabel.textColor = .black
        resultAddLabel.text = "Результат: "
        
        //Лейбл результата угадывания
        resultGuessLabel.frame = CGRect(x: 210, y: 350, width: 150, height: 50)
        resultGuessLabel.backgroundColor = .gray
        resultGuessLabel.textColor = .black
        resultGuessLabel.text = "Результат: "
        
        self.view.addSubview(greetingLabel)
        self.view.addSubview(resultAddLabel)
        self.view.addSubview(resultGuessLabel)
        self.view.addSubview(addButton)
        self.view.addSubview(guessButton)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Фон
        view.backgroundColor = .darkGray
        createViews()
    }
    
    // - MARK: Добавляем действия для кнопок
    
    @objc func addButtonAction(sender: UIButton) {
        
        addTwoNumbers()
        
        func addTwoNumbers() {
            
            //Создаем алерт для ввода цифр которые необходимо сложить
            let addAlertController = UIAlertController(title: "Пожалуйста", message: "Введите числа", preferredStyle: .alert)
            addAlertController.addTextField { UITextField in
                UITextField.placeholder = "Число 1"
            }
            
            addAlertController.addTextField { UITextField in
                UITextField.placeholder = "Число 2"
            }
            
            //Создаем действие сложение 2 чисел
            let actionAdd = UIAlertAction(title: "Сложить", style: .default) { _ in
                let numberOne = Int((addAlertController.textFields?[0].text!)!)
                let numberTwo = Int((addAlertController.textFields?[1].text!)!)
                self.resultAddLabel.text! = String((numberOne ?? 0) + (numberTwo ?? 0))
            }
            
            addAlertController.addAction(actionAdd)
            self.present(addAlertController, animated: true)
        }
    }
    
    @objc func guessButtonAction(sender: UIButton) {
        
        //Создаем алерт для ввода цифры которую будем угадывать
        let number = Int.random(in: 1...10)
        print(number)
        let guessAlertController = UIAlertController(title: "Угадайте число", message: "Загадайте от 1 до 10", preferredStyle: .alert)
        guessAlertController.addTextField { UITextField in
            UITextField.placeholder = "1 - 10"
        }
        
        //Создаем действие угадывания числа
        let actionGuess = UIAlertAction(title: "OK", style: .default) { _ in
            if let inputedNumber = guessAlertController.textFields?.first?.text {
                print(inputedNumber)
                if number == Int(inputedNumber) {
                    self.resultGuessLabel.text = ":)"
                } else {
                    self.resultGuessLabel.text = ":("
                }
            }
        }
        
        guessAlertController.addAction(actionGuess)
        self.present(guessAlertController, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        alertRegistration()
    }
    // - MARK: Создаем приветственный алерт
    
    private func alertRegistration() {
        
        let alertControllerRegistration = UIAlertController(title: "Регистрация", message: "Введите ваше ФИО", preferredStyle: .alert)
        alertControllerRegistration.addTextField { UITextField in
            UITextField.placeholder = "ФИО"
        }
        
        //Создаем варианты при наличии и отсутствии name
        let actionRegistration = UIAlertAction(title: "ОК", style: .default) { _ in
            guard let name = alertControllerRegistration.textFields?.first?.text?.capitalized else { return }
            if name.isEmpty {
                self.greetingLabel.text = "Приветствую, Гость!"
            } else {
                self.greetingLabel.text = "Приветствую, " + name + "!"
            }
        }
        
        alertControllerRegistration.addAction(actionRegistration)
        self.present(alertControllerRegistration, animated: true)
    }
}


