import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buckysButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // how long it to be
        // what trying to do
        
        // create animation block to fade out
        UIView.animate(withDuration: 3, animations: {
            let grow = CGAffineTransformMakeScale(4,4)
            let angle = CGFloat(40)
            let rotate = CGAffineTransformMakeRotation(angle)
            self.buckysButton.transform = CGAffineTransformConcat(grow, rotate)
        })
        
    }

}

