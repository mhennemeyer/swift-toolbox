//
//  File.swift
//  
//
//  Created by Matthias Hennemeyer on 11.10.21.
//

import UIKit

class TapableSegmentControl : UISegmentedControl {
    var onTapSelected: (Int -> Void);
    
    public override var selectedSegmentIndex: Int {
        get {
            super.selectedSegmentIndex
        }
        set {
            super.selectedSegmentIndex = newValue
        }
    }
}
