import UIKit

class DrawExamples: UIView {

    override func draw(_ rect: CGRect) {
        // context is the object used for drawing
        let context = UIGraphicsGetCurrentContext()
//        CGContextSetLineWidth(context, 3.0)
//        CGContextSetStrokeColorWithColor(context, UIColor.purpleColor().CGColor)
//
//        // Create path
//        CGContextMoveToPoint(context, 0, 0)
//        CGContextAddLineToPoint(context, 250, 320)
//
//        // Actually draw the path
//        CGContextStrokePath(context)
//
        
        let rectangle = CGRect(50, 50, 200, 400)
        CGContext(context, rectangle)
        
        
    }

}
