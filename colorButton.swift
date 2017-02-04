//
//  colorButton.swift
//  DannyWeiner-Lab3
//
//  Created by Danny Weiner on 9/24/16.
//  Copyright © 2016 cse438s. All rights reserved.
//

import UIKit

class colorButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
