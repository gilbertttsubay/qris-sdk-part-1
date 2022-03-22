//
// Created by Gilbert on 3/16/22.
//

import Foundation
import Foundation
import UIKit
extension UIApplication {


    class func QRtopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return QRtopViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return QRtopViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return QRtopViewController(base: presented)
        }
        return base
    }
}