//
//  ViewController.swift
//  UIHW1.2
//
//  Created by Сергей Ангелов on 15.10.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Создаем лейбл и кнопку
    
    private let startButton = UIButton()
    private let helloLabel = UILabel()
    
    private func createViews() {
        
        //Кнопка запуска
        startButton.frame = CGRect(x: 98, y: 440, width: 200, height: 200)
        startButton.setTitle("Начать", for: .normal)
        startButton.backgroundColor = .red
        startButton.layer.cornerRadius = 40
        startButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        
        //Лейбл результата
        helloLabel.frame = CGRect(x: 98, y: 300, width: 200, height: 40)
        helloLabel.backgroundColor = .white
        helloLabel.textColor = .black
        helloLabel.textAlignment = .center
        
        self.view.addSubview(startButton)
        self.view.addSubview(helloLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Фон
        view.backgroundColor = .darkGray
        
        createViews()
    }
    
    //MARK: - Добавляем действие для кнопки
    
    @objc func alertAction(sender: UIButton) {
        
       //Создаем алерт для ввода слова
        let alertInputWord = UIAlertController(title: "Пожалуйста", message: "Введите leohl", preferredStyle: .alert)
        alertInputWord.addTextField { UITextField in
            UITextField.placeholder = "leohl"
        }
        
        //Создаем конструктор
        
        let actionWord = UIAlertAction(title: "Ok", style: .default) { _ in
            if let word = alertInputWord.textFields?[0],
               word.text == "leohl" {
                self.helloLabel.text = "hello"
            } else {
                self.helloLabel.text = "Ошибка!"
            }
        }
        alertInputWord.addAction(actionWord)
        self.present(alertInputWord, animated: true)
    }
}
    
    
