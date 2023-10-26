
import UIKit

final class ViewControllerTwo: UIViewController {
    
    @IBOutlet weak var tableNumber: UITextField!
    @IBOutlet weak var countGuests: UITextField!
    @IBOutlet weak var fio: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkButton.layer.cornerRadius = 15
    }
    
    @IBAction func checkButtonAction(_ sender: UIButton) {
        
        if fio.text!.isEmpty || countGuests.text!.isEmpty || tableNumber.text!.isEmpty {
            let alertInfo = UIAlertController(title: "Ошибка", message: "Введите информацию", preferredStyle: .actionSheet)
            let alertInfoAction = UIAlertAction(title: "OK", style: .destructive)
            alertInfo.addAction(alertInfoAction)
            self.present(alertInfo, animated: true)
        } else {
            let alertCheck = UIAlertController(title: "Выставить счет?", message: "", preferredStyle: .alert)
            let alertCancelButton = UIAlertAction(title: "Отмена", style: .destructive)
            let actionOkButton = UIAlertAction(title: "Да", style: .default, handler: { _  in
                self.showControllerThree()
            })
            
            alertCheck.addAction(actionOkButton)
            alertCheck.addAction(alertCancelButton)
            self.present(alertCheck, animated: true)
        }
    }
    
    func showControllerThree() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationController = storyboard.instantiateViewController(identifier: "ViewControllerThree")
        navigationController?.pushViewController(destinationController, animated: true)
    }
}
