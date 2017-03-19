//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class MainView: UIViewController, MainViewProtocol {
    
    
    private lazy var button = UIButton(type: .system)
    private lazy var label = UILabel()
    private lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    
    var state: MainViewState = .initial {
        didSet {
            render(oldState: oldValue, newState: state)
        }
    }
    
    let loadClick = Signal<Void>()
    let detailsClick = Signal<Void>()
    
    //MARK:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SilverMVC"
        
        view.backgroundColor = .white
        
        view.addSubview(activityIndicator)
        
        button.setTitle("Load", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
        
        label.numberOfLines = 0
        view.addSubview(label)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Details", style: .plain, target: self, action: #selector(detailsClicked))
        
        render(oldState: state, newState: state)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        activityIndicator.frame = view.bounds
        label.frame = UIEdgeInsetsInsetRect(view.bounds, UIEdgeInsets(top: 80, left: 20, bottom: 80, right: 20))
        button.frame = CGRect(x: 20, y: view.bounds.height - 60, width: view.bounds.width - 40, height: 40)
    }
    
    //MARK: 
    
    @objc private func detailsClicked() {
        detailsClick.update()
    }
    
    @objc private func buttonClicked() {
        loadClick.update()
    }
    
    //MARK: -
    
    func render(oldState: MainViewState, newState: MainViewState) {
        
        switch state {
        case .initial:
            label.text = nil
            navigationItem.rightBarButtonItem?.isEnabled = false
            activityIndicator.stopAnimating()
            button.isEnabled = true
        case .loading:
            label.text = nil
            activityIndicator.startAnimating()
            navigationItem.rightBarButtonItem?.isEnabled = false
            button.isEnabled = false
        case .text(let text):
            label.text = text
            activityIndicator.stopAnimating()
            navigationItem.rightBarButtonItem?.isEnabled = true
            button.isEnabled = true
        }
    }
}

