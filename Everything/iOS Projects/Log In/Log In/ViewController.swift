import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.email.resignFirstResponder()
        self.password.resignFirstResponder()
    }
    
    // Built in method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

