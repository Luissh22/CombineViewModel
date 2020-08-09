//
//  ViewModel.swift
//  
//
//  Created by Luis Abraham on 2020-08-09.
//

import Combine

/// View Models will have no outputs.
public protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    associatedtype State
    associatedtype Input
    
    /// View state
    var state: State { get }
    
    /// Triggers state changes
    func trigger(_ input: Input)
}
