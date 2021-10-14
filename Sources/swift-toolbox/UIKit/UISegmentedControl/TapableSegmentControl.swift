//
//  File.swift
//  
//
//  Created by Matthias Hennemeyer on 11.10.21.
//

import UIKit

public class TapableSegmentControl : UISegmentedControl {
    public var onTapSelected: ((Int) -> Void) = {_ in };
    
    var oldValue: Int = 0
    
    public override var selectedSegmentIndex: Int {
        get {
            super.selectedSegmentIndex
        }
        set {
            oldValue = selectedSegmentIndex
            super.selectedSegmentIndex = newValue
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        onTapSelected(oldValue)
        super.touchesBegan(touches, with: event)
    }
}
