import UIKit

open class UIXIBView: UIView, XIBView {
    @IBOutlet weak public var contentView : UIView?
    
    @IBOutlet public var controller: UIViewController!
    // var controller: UIViewController! // external reference
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        setup()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    open func setup() {}
}
