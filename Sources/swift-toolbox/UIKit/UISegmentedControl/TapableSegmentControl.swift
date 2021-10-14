//
//  File.swift
//  
//
//  Created by Matthias Hennemeyer on 11.10.21.
//

import UIKit

public class TapableSegmentControl : UISegmentedControl {
    var onTapSelected: ((Int) -> Void) = {_ in };
    
    public override var selectedSegmentIndex: Int {
        get {
            super.selectedSegmentIndex
        }
        set {
            if selectedSegmentIndex == newValue {
                onTapSelected(selectedSegmentIndex)
            }
            super.selectedSegmentIndex = newValue
        }
    }
}
