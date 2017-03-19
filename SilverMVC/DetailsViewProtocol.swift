//
//  DetailsViewControllerProtocol.swift
//  MVPBRF

import Foundation

protocol DetailsViewProtocol: ViewProtocol {
    
}

protocol DetailsViewContainer {
    func makeDetailsView(text: String) -> DetailsViewProtocol
}
