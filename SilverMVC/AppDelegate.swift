//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let context = ProductionContext()
    private lazy var window: WindowProtocol = self.context.makeWindow()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window.controller = WindowPresenter(window: window, context: context)
        window.makeKeyAndVisible()
        
        return true
    }
}
