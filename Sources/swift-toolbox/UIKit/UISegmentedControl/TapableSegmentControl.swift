//
//  File.swift
//  
//
//  Created by Matthias Hennemeyer on 11.10.21.
//

import UIKit

public class TapableSegmentControl : UISegmentedControl {
    public var onTap: ((Int, Int) -> Void) = {_, _ in };
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let oldValue = selectedSegmentIndex
        super.touchesBegan(touches, with: event)
        onTap(oldValue, selectedSegmentIndex)
    }
}
