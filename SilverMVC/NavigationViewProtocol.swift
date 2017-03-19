//
//  Created by Pavel Sharanda on 19.03.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import Foundation

protocol NavigationViewProtocol: ViewProtocol {
    func pushView(view: ViewProtocol, animated: Bool)
    func popView(view: ViewProtocol, animated: Bool) -> ViewProtocol?
    
    var views: [ViewProtocol] {get set}
}

protocol NavigationViewContainer {
    func makeNavigationView() -> NavigationViewProtocol
}
