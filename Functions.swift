//
//  Functions.swift
//  Drawing
//
//  Created by Todd Sproull on 9/21/16.
//  Copyright © 2016 Todd Sproull. All rights reserved.
//

import UIKit


/////////////////////////////////////////////////

private func findMidpoint(firstPoint: CGPoint, secondPoint: CGPoint) -> CGPoint {
    let newX = (firstPoint.x + secondPoint.x) / 2
    let newY = (firstPoint.y + secondPoint.y) / 2
    return CGPoint(x: newX, y: newY)
    
}

/////////////////////////////////////////////////

func createQuadPath(arrayOfPoints: [CGPoint]) -> UIBezierPath {
    let newPath = UIBezierPath()
    let firstLocation = arrayOfPoints[0]
    newPath.moveToPoint(firstLocation)
    if arrayOfPoints.count >= 2 {
        let secondLocation = arrayOfPoints[1]
        let firstMidpoint = findMidpoint(firstLocation, secondPoint: secondLocation)
        newPath.addLineToPoint(firstMidpoint)
        for index in 1 ..< arrayOfPoints.count-1 {
            let currentLocation = arrayOfPoints[index]
            var at = index
            if (index + 1) < arrayOfPoints.count-1 {
                at = (index + 1)
            } else {
                at = (arrayOfPoints.count - 2)
            }
            
            let nextLocation = arrayOfPoints[at]
            
            let midpoint = findMidpoint(currentLocation, secondPoint: nextLocation)
            newPath.addQuadCurveToPoint(midpoint, controlPoint: currentLocation)
        }
        let lastLocation = arrayOfPoints.last
        if lastLocation != nil {
            newPath.addLineToPoint(lastLocation!)
        }

    }
        return newPath
}

