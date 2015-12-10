import UIKit

extension UIFont {
    class func regular(size: Double) -> UIFont {
        return UIFont(name: "Montserrat-Regular", size: CGFloat(size))!
    }

    class func bold(size: Double) -> UIFont {
        return UIFont(name: "Montserrat-Bold", size: CGFloat(size))!
    }
}
