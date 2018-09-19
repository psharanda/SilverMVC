//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let context = ProductionContext()
    private lazy var window: WindowProtocol = self.context.makeWindow()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window.presenter = WindowPresenter(window: window, context: context)
        window.makeKeyAndVisible()
        
        return true
    }
}
