
import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterButton.layer.cornerRadius = 15
    }
    
    @IBAction func enterButtonAction(_ sender: UIButton) {
        
        if password.text!.isEmpty || email.text!.isEmpty {
            let alertEnter = UIAlertController(title: "Ошибка", message: "Введите email и password", preferredStyle: .actionSheet)
            let alertInfoAction = UIAlertAction(title: "OK", style: .destructive)
            alertEnter.addAction(alertInfoAction)
            self.present(alertEnter, animated: true)
        }
    }
}


