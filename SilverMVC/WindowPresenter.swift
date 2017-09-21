//
//  Created by Pavel Sharanda on 23.02.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import Foundation

class WindowPresenter {
    
    unowned let window: WindowProtocol
    let context: AppContext
    
    init(window: WindowProtocol, context: AppContext) {
        self.context = context
        self.window = window
        
        
        
        
        let navigationView = context.makeNavigationView()
        navigationView.presenter = NavigationPresenter(navigationView: navigationView, context: context)        
        window.rootView = navigationView
    }
}
