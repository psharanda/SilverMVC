//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

enum MainViewState {
    case initial
    case loading
    case text(String)
    
    var text: String? {
        switch self {
        case .initial:
            return nil
        case .loading:
            return nil
        case  .text(let t):
            return t
        }
    }
}

protocol MainViewProtocol: ViewProtocol {
    
    var loadClick: Signal<Void> {get}
    var detailsClick: Signal<Void> {get}
    
    var state: MainViewState {get set}
}

protocol MainViewContainer {
    func makeMainView() -> MainViewProtocol
}


