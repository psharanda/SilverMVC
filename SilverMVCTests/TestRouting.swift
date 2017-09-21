//
//  Created by Pavel Sharanda on 23.02.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import UIKit

class TestView {
    var presenter: AnyObject?
}

class TestNavigationView: TestView, NavigationViewProtocol {
    func pushView(view: ViewProtocol, animated: Bool) {
        views.append(view)
    }
    
    func popView(view: ViewProtocol, animated: Bool) -> ViewProtocol? {
        return views.removeLast()
    }
    
    var views: [ViewProtocol] = []
    
    var viewController: UIViewController {
        fatalError()
    }
}

class TestWindow: TestView, WindowProtocol {
    var rootView: ViewProtocol?
    func makeKeyAndVisible() {
        
    }
}
