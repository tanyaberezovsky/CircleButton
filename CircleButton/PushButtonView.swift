//
//  PushButtonView.swift
//  CircleButton
//
//  Created by Tania on 13/02/2016.
//  Copyright © 2016 Tania Berezovski. All rights reserved.
//
import UIKit

@IBDesignable
class PushButtonView: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    
    @IBInspectable var borderColor: UIColor = UIColor.blackColor()
    
    @IBInspectable var isAddButton: Bool = true
    
    override func drawRect(rect: CGRect) {
       //1
        /*draw down border circle*/
        
        let ovalPath = UIBezierPath(ovalInRect: rect)
        borderColor.setFill()
        ovalPath.fill()

        
        //2
    /*draw uper circle*/
        let path = UIBezierPath(ovalInRect: CGRectMake(0, 0, rect.width-4, rect.height-4))
        // move it
        let translation = CGSize(width: 2, height: 2)
        path.applyTransform(CGAffineTransformMakeTranslation(translation.width,
            translation.height))
        fillColor.setFill()
        path.fill()
        
        
  /*draw horizontal line*/
        //set up the width and height variables
        //for the horizontal stroke
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        //create the path
        let plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        plusPath.lineWidth = plusHeight
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        plusPath.moveToPoint(CGPoint(
            x:bounds.width/2 - plusWidth/2 + 0.5,
            y:bounds.height/2 + 0.5))
        
        //add a point to the path at the end of the stroke
        plusPath.addLineToPoint(CGPoint(
            x:bounds.width/2 + plusWidth/2 + 0.5,
            y:bounds.height/2 + 0.5))

        /*draw verlical line*/
        //Vertical Line
        if isAddButton {
            //move to the start of the vertical stroke
            plusPath.moveToPoint(CGPoint(
                x:bounds.width/2 + 0.5,
                y:bounds.height/2 - plusWidth/2 + 0.5))
            
            //add the end point to the vertical stroke
            plusPath.addLineToPoint(CGPoint(
                x:bounds.width/2 + 0.5,
                y:bounds.height/2 + plusWidth/2 + 0.5))
        }
        
        //set the stroke color
        borderColor.setStroke()
        
        //draw the stroke
        plusPath.stroke()
        
    }
    
}
