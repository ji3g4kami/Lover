
import UIKit

extension UIImage {
  var upOrientationImage: UIImage? {
    switch imageOrientation {
    case .up:
      return self
    default:
      UIGraphicsBeginImageContextWithOptions(size, false, scale)
      draw(in: CGRect(origin: .zero, size: size))
      let result = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return result
    }
  }
}
