//
//  Created by Pavel Sharanda on 23.02.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import UIKit

private var presenterKey: Int = 0

extension UIWindow: Window {}

extension Window where Self: UIWindow {
    
    var rootView: View? {
        set {
            rootViewController = newValue as! UIViewController?
        }
        get {
            return rootViewController
        }
    }
    
    func install() {
        makeKeyAndVisible()
    }
    
    var controller: AnyObject? {
        get {
            return objc_getAssociatedObject(self, &presenterKey) as AnyObject
        }
        
        set {
            objc_setAssociatedObject(self, &presenterKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}


extension UIViewController: View {
    
    var controller: AnyObject? {
        get {
            return objc_getAssociatedObject(self, &presenterKey) as AnyObject
        }
        
        set {
            objc_setAssociatedObject(self, &presenterKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension UINavigationController: NavigationView {}

extension NavigationView where Self: UINavigationController {
    
    func pushView(view: View, animated: Bool) {
        pushViewController(view as! UIViewController, animated: animated)
    }
    
    func popView(view: View, animated: Bool) -> View? {
        return popViewController(animated: animated)
    }
    
    var views: [View] {
        set {
            viewControllers = newValue.map { $0 as! UIViewController }
        }
        get {
            return viewControllers
        }
    }
}
