//
//  Created by Pavel Sharanda on 20.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class ProductionContext: AppContext {
    
    //example of internal singleton
    private static let textLoader = TextLoader()
    func makeTextLoader() -> TextLoaderProtocol {
        return ProductionContext.textLoader
    }
    
    func makeMainView() -> MainViewProtocol {
        return MainView()
    }

    func makeDetailsView(text: String) -> DetailsViewProtocol {
        return DetailsViewController(text: text)
    }

    func makeNavigationView() -> NavigationViewProtocol {
        return UINavigationController()
    }
    
    func makeWindow() -> WindowProtocol {
        return UIWindow(frame: UIScreen.main.bounds)
    }
}
