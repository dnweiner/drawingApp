//
//  ViewController.swift
//  DannyWeiner-Lab3
//
//  Created by Danny Weiner on 9/21/16.
//  Copyright © 2016 cse438s. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var drawView: UIView!
    
    var allPaths = [UIView]()
    var lastPaths = [UIView]()
    
    @IBAction func clearBtn(sender: AnyObject, forEvent event: UIEvent) {
        print("Time to clear")
        for v in drawView.subviews {
            v.removeFromSuperview()
        }
        allPaths.removeAll()
        lastPaths.removeAll()
    }
    
    var currPathSource = CGPointZero
    var currPath: PathView? = nil
    var myThickness = CGFloat(3.0)
    var myColor = UIColor.blackColor()
    
    @IBAction func colorButtons(sender: UIButton) {
        switch(sender.tag) {
        case 0:
            myColor = UIColor.redColor()
            break
        case 1:
            myColor = UIColor.orangeColor()
            break
        case 2:
            myColor = UIColor.yellowColor()
            break
        case 3:
            myColor = UIColor.greenColor()
            break
        case 4:
            myColor = UIColor.blueColor()
            break
        case 5:
            myColor = UIColor.purpleColor()
            break
        case 6:
            myColor = UIColor.blackColor()
            break
        case 7:
            myColor = UIColor.whiteColor()
            break
        default:
            myColor = UIColor.blackColor()
        }
    }
    
    
    @IBAction func thicknessSlider(sender: UISlider, forEvent event: UIEvent) {
        myThickness = CGFloat(sender.value)
    }
    

    @IBAction func undoBtn(sender: UIButton, forEvent event: UIEvent) {
        if (!allPaths.isEmpty) {
            allPaths.last!.removeFromSuperview()
            lastPaths.append(allPaths.removeLast())
        }
    }
    
    @IBAction func redoBtn(sender: UIButton) {
        if (!lastPaths.isEmpty) {
            drawView.addSubview(lastPaths.first!)
            allPaths.append(lastPaths.removeFirst())
        }
    }
    
    @IBAction func invertBtn(sender: UIButton) {
        let back = drawView.backgroundColor
        drawView.backgroundColor = myColor
        myColor = back!
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touchPoint = (touches.first)!.locationInView(self.view) as CGPoint
        print ("the location is \(touchPoint)")
        currPathSource = touchPoint
        
        let myRect = CGRect(x:0, y: 0, width:self.view.frame.width, height: self.view.frame.height)
        currPath = PathView(frame: myRect)
        currPath?.thePath = Path(color: myColor, thickness: myThickness, array: [touchPoint], source: currPathSource)
        currPath!.backgroundColor = UIColor.clearColor()
        
        drawView.addSubview(currPath!)
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touchPoint = (touches.first)!.locationInView(self.view) as CGPoint
        print("In touchesMoved at \(touchPoint)")
        
        //let distance = Functions.distance(touchPoint, b: currPathSource)
        
        currPath?.thePath?.array.append(touchPoint)
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        //let touchPoint = (touches.first)!.locationInView(self.view) as CGPoint
        
        allPaths.append(drawView.subviews.last!)
    }
    
    
    
    
    
    
    
}

