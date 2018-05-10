//
//  DesignableView.swift
//  SongTheoDungMucDich
//
//  Created by Nguyen Hieu Trung on 4/18/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {
    
    @IBInspectable var radiusView:CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = radiusView;
        }
    }
    
    @IBInspectable var viewBorderWidth:CGFloat = 0 {
        didSet{
            self.layer.borderWidth = viewBorderWidth;
        }
    }
    
    @IBInspectable var viewBorderColor:UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = viewBorderColor.cgColor;
        }
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
