import UIKit
#if canImport(SwiftyGif)
import SwiftyGif
enum GifLoop {
    case infinite
}

extension UIImageView {
    func setImage(gif gifName: String, loop: Int) {
        if let gif = try? UIImage(gifName: gifName) {
            setGifImage(gif, loopCount: loop)
        }
    }
    
    func setImage(gif gifName: String?, loop: GifLoop) {
        if let gifName = gifName, let gif = try? UIImage(gifName: gifName) {
            setGifImage(gif, loopCount: -1)
        }
    }
}

#endif

