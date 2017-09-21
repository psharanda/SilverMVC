//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation


class NavigationPresenter {
    
    unowned let navigationView: NavigationViewProtocol
    let context: AppContext
    
    init(navigationView: NavigationViewProtocol, context: AppContext) {
        self.context = context
        self.navigationView = navigationView
               
        navigationView.views = [setupMainView()]
    }
    
    func setupMainView() -> MainViewProtocol {
        let view = context.makeMainView()
        let presenter = MainPresenter(textLoader: context.makeTextLoader(), view: view)
        view.presenter = presenter
        
        presenter.showDetails.subscribe {[unowned self, unowned presenter] in
            let vc = self.context.makeDetailsView(text: presenter.view.state.text ?? "WTF?")
            self.navigationView.pushView(view: vc, animated: true)
        }
        
        return view
    }
}
