//
//  UIApplication+Extension.swift
//  ViperPokemon2
//
//  Created by Adrian San Martin on 03/06/24.
//

import Foundation

import Foundation
import UIKit

extension UIApplication {
    static var window: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow}
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    class func getTopViewController(base: UIViewController? = UIApplication.window?.rootViewController) -> UIViewController? {
        
        if let navigationController = base as? UINavigationController {
            return getTopViewController(base: navigationController.visibleViewController)
            
        } else if let tabBarController = base as? UITabBarController, let selected = tabBarController.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
