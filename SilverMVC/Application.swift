//
//  Created by Pavel Sharanda on 23.02.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import Foundation

typealias AppContext = TextLoaderContainer & MainViewContainer & NavigationControllerContainer & WindowContainer & DetailsViewContainer


class Application {
    
    let window: Window
    let context: AppContext
    
    init(context: AppContext) {
        self.context = context
        
        window = context.makeWindow()
        
        let navigationView = context.makeNavigationView()
        navigationView.presenter = Wireframe(navigationView: navigationView, context: context)
        
        window.rootView = navigationView
        
        window.install()
    }
}
