//
//  Created by Pavel Sharanda on 19.03.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import Foundation

protocol WindowProtocol: ViewProtocol {
    var rootView: ViewProtocol? {get set}
    func makeKeyAndVisible()
}

protocol WindowContainer {
    func makeWindow() -> WindowProtocol
}
