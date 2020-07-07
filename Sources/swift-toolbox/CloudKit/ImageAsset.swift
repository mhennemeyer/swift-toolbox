import CloudKit
import UIKit

public class ImageAsset {

    let image: UIImage

    var url: URL?

    var asset:CKAsset? {
        get {
            let data = self.image.pngData()
            self.url = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(NSUUID().uuidString+".dat")
            if let url = self.url {
                do {
                    try data!.write(to: url)
                    print("write foto to disk")
                } catch {
                    print(error)
                }
                return CKAsset(fileURL: url)
            }
            print("error creating asset from image")
            return nil
        }
    }

    init(image:UIImage){
        self.image = image
    }

    func clear() {
        print("clear image asset")
        if let url = self.url {
            do {
                try FileManager.default.removeItem(at: url) }
            catch let e {
                print("Error deleting temp file: \(e)")
            }
        }
    }


}

extension CKAsset {
    func uiImage() -> UIImage? {
        if let data = try? Data(contentsOf: (fileURL!)), let image = UIImage(data: data) {
            return image
        }
        return nil
    }
}
