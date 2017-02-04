//
//  PathView.swift
//  DannyWeiner-Lab3
//
//  Created by Danny Weiner on 9/24/16.
//  Copyright © 2016 cse438s. All rights reserved.
//

import UIKit


//
//  Based on
//  CircleView.swift
//  Drawing
//
//  Created by Todd Sproull on 9/21/16.
//  Copyright © 2016 Todd Sproull. All rights reserved.
//


class PathView: UIView {
    
    var thePath:Path? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        thePath?.color.setFill()
        thePath?.color.setStroke()
        
        let path = UIBezierPath()
        print("in drawRect with \(thePath)")
        path.addArcWithCenter((thePath?.source)!, radius: ((thePath?.thickness)! / 10), startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        path.appendPath(createQuadPath((thePath?.array)!))
        path.lineWidth = (thePath?.thickness)!
        path.lineCapStyle = .Round
        path.stroke()
        //path.fill()
        
    }
    
    
}
