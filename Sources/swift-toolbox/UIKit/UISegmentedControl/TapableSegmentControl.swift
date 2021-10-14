//
//  File.swift
//  
//
//  Created by Matthias Hennemeyer on 11.10.21.
//

import UIKit

public class TapableSegmentControl : UISegmentedControl {
    public var onTapSelected: ((Int) -> Void) = {_ in };
    
    public override var selectedSegmentIndex: Int {
        get {
            super.selectedSegmentIndex
        }
        set {
            print("set selected \(newValue)")
            if selectedSegmentIndex == newValue {
                onTapSelected(selectedSegmentIndex)
            }
            super.selectedSegmentIndex = newValue
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        onTapSelected(selectedSegmentIndex)
    }
}
