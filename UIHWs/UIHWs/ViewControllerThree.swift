
import UIKit

final class ViewControllerThree: UIViewController {
    
    @IBOutlet weak var payButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payButton.layer.cornerRadius = 15
    }
}
