//
//  LabelScroll
//  SwiftyScrollingLabel
//
//  Created by Arjun on 09/01/19.
//  Copyright © 2019 SahilBeri. All rights reserved.
//

import UIKit

@IBDesignable
class LabelScroll: UIView {

    // Scroll View
    var scrollView : UIScrollView!
    // Main label
    var label: UILabel!
    
    // Set LabelScroll Font Size Default is 15
    @IBInspectable var FontSize:CGFloat = 15 {
        didSet {
            label.font = label.font.withSize(FontSize)
        }
    }
    
    // Set LabelScroll Font Name
    @IBInspectable var FontName:String = "" {
        didSet {
            label.font = UIFont(name: FontName, size: FontSize)
        }
    }
    
    // Set LabelScroll Back Ground Color
    @IBInspectable var labelBgColor: UIColor = .yellow {
        didSet {
            scrollView.backgroundColor = labelBgColor
            self.backgroundColor = labelBgColor
        }
    }
    
    // Set LabelScroll Border Width
    @IBInspectable var labelBorderWidth: CGFloat = 0
        {
        didSet {
            label.layer.borderWidth = labelBorderWidth
        }
    }
    
    // Set LabelScroll Corner Radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
                label.clipsToBounds = true
                label.layer.cornerRadius = cornerRadius
                label.layer.masksToBounds = cornerRadius > 0
        }
    }
    // Set LabelScroll Attributed Text
    public var attributedText: NSAttributedString? {
        didSet {
            label.attributedText = attributedText
        }
    }
    // Set LabelScroll Text Color
    @IBInspectable var textColor: UIColor! = .yellow {
        didSet {
            label.textColor = textColor
        }
    }
    
    // Set LabelScroll Text
    @IBInspectable var labelText: String = "" {
        didSet {
            label.text = labelText
        }
    }
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateView()
    }
    
    // Set LabelScroll View Lay out
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set Constraint Scroll View
        self.addConstraint(scrollView, toView: self, attribute: .top, constant: 0.0)
        self.addConstraint(scrollView, toView: self, attribute: .leading, constant: 2.0)
        self.addConstraint(scrollView, toView: self, attribute: .bottom, constant: 0.0)
        self.addConstraint(scrollView, toView: self, attribute: .trailing, constant: 2.0)
        
         // Set Constraint LAbel 
        self.addConstraint(label, toView: scrollView, attribute: .top, constant: 0.0)
        self.addConstraint(label, toView: scrollView, attribute: .leading, constant: 0.0)
        self.addConstraint(label, toView: scrollView, attribute: .bottom, constant: 0.0)
        self.addConstraint(label, toView: scrollView, attribute: .trailing, constant: 0.0)
    }
    
    func updateView() {
        self.clipsToBounds = true
        scrollView = UIScrollView()
        label = UILabel()
        // Add Label in to Scroll View
        scrollView.addSubview(label)
        // add Scroll view in main View
        self.addSubview(scrollView)
    }
    
   
    func addConstraint(_ newView: UIView, toView: UIView, attribute: NSLayoutAttribute, constant: CGFloat) {
        let constraint =  NSLayoutConstraint(item: newView, attribute: attribute, relatedBy: .equal, toItem: toView, attribute: attribute, multiplier: 1.0, constant: constant)
        toView.addConstraint(constraint)
    }
    
}

