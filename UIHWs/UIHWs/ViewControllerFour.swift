
import UIKit

final class ViewControllerFour: UIViewController {

    @IBOutlet weak var paymentButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        paymentButton.layer.cornerRadius = 15
    }
}
