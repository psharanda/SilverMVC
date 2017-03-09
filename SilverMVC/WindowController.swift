//
//  Created by Pavel Sharanda on 23.02.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import Foundation

class WindowController {
    
    unowned let window: Window
    let context: AppContext
    
    init(window: Window, context: AppContext) {
        self.context = context
        self.window = window
        
        let navigationView = context.makeNavigationView()
        navigationView.controller = NavigationController(navigationView: navigationView, context: context)        
        window.rootView = navigationView
    }
}
