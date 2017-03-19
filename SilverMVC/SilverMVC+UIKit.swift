//
//  Created by Pavel Sharanda on 23.02.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import UIKit

private var controllerKey: Int = 0

extension UIViewController: ViewProtocol {
    
    var controller: AnyObject? {
        get {
            return objc_getAssociatedObject(self, &controllerKey) as AnyObject
        }
        
        set {
            objc_setAssociatedObject(self, &controllerKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension UIWindow: WindowProtocol {
    
    var rootView: ViewProtocol? {
        set {
            rootViewController = newValue as! UIViewController?
        }
        get {
            return rootViewController
        }
    }
    
    var controller: AnyObject? {
        get {
            return objc_getAssociatedObject(self, &controllerKey) as AnyObject
        }
        
        set {
            objc_setAssociatedObject(self, &controllerKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension UINavigationController: NavigationViewProtocol {
    
    func pushView(view: ViewProtocol, animated: Bool) {
        pushViewController(view as! UIViewController, animated: animated)
    }
    
    func popView(view: ViewProtocol, animated: Bool) -> ViewProtocol? {
        return popViewController(animated: animated)
    }
    
    var views: [ViewProtocol] {
        set {
            viewControllers = newValue.map { $0 as! UIViewController }
        }
        get {
            return viewControllers
        }
    }
}
