//
//  Path.swift
//  DannyWeiner-Lab3
//
//  Created by Danny Weiner on 9/24/16.
//  Copyright © 2016 cse438s. All rights reserved.
//

import UIKit

//
//  Based on
//  Circle.swift
//  Drawing
//
//  Created by Todd Sproull on 9/21/16.
//  Copyright © 2016 Todd Sproull. All rights reserved.
//


struct Path {
    
    var color: UIColor
    var thickness: CGFloat
    var array: [CGPoint]
    var source: CGPoint
    
    init(color: UIColor = UIColor.blackColor(), thickness: CGFloat = 3.0, array: [CGPoint], source: CGPoint) {
        self.color = color
        self.thickness = thickness
        self.array = array
        self.source = source
    }
}
