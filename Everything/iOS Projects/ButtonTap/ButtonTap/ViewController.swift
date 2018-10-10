import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buckysLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        // sender is the object that called this method (button)
        let title = sender.title(for: .normal)!
        
        buckysLabel.text = "You clikced the \(title) button"
        
    }
    
}
