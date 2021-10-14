//
//  File.swift
//  
//
//  Created by Matthias Hennemeyer on 11.10.21.
//

import UIKit

public class TapableSegmentControl : UISegmentedControl {
    public var onTap: ((Int, Int) -> Void) = {_, _ in };
    
    var priorSelected: Int = 0
    
    public override var selectedSegmentIndex: NSInteger {
        get {
            super.selectedSegmentIndex
        }
        set {
            onTap(selectedSegmentIndex, newValue)
            super.selectedSegmentIndex = newValue
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //onTapSelected(oldValue)
        super.touchesBegan(touches, with: event)
    }
}
