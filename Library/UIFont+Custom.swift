import UIKit

extension UIFont {
    class func black(size: Double) -> UIFont {
        return UIFont(name: "ProximaNova-Black", size: CGFloat(size))!
    }

    class func extraBold(size: Double) -> UIFont {
        return UIFont(name: "ProximaNova-Extrabld", size: CGFloat(size))!
    }

    class func regular(size: Double) -> UIFont {
        return UIFont(name: "ProximaNova-Regular", size: CGFloat(size))!
    }

    class func thin(size: Double) -> UIFont {
        return UIFont(name: "ProximaNovaT-Thin", size: CGFloat(size))!
    }

    class func bold(size: Double) -> UIFont {
        return UIFont(name: "ProximaNova-Bold", size: CGFloat(size))!
    }

    class func light(size: Double) -> UIFont {
        return UIFont(name: "ProximaNova-Light", size: CGFloat(size))!
    }

    class func semiBold(size: Double) -> UIFont {
        return UIFont(name: "ProximaNova-Semibold", size: CGFloat(size))!
    }
}