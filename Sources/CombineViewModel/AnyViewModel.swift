//
//  AnyViewModel.swift
//  
//
//  Created by Luis Abraham on 2020-08-09.
//

import Combine

/// Wrapper over ViewModel providing type erasure
final class AnyViewModel<State, Input>: ObservableObject {
    
    private let wrappedObjectWillChange: () -> AnyPublisher<Void, Never>
    private let wrappedState: () -> State
    private let wrappedTrigger: (Input) -> Void
    
    var objectWillChange: some Publisher {
        wrappedObjectWillChange()
    }
    
    var state: State {
        wrappedState()
    }
    
    func trigger(_ input: Input) {
        wrappedTrigger(input)
    }
    
    init<V: ViewModel>(_ viewModel: V) where V.State == State, V.Input == Input {
        self.wrappedObjectWillChange = { viewModel.objectWillChange.eraseToAnyPublisher() }
        self.wrappedState = { viewModel.state }
        self.wrappedTrigger = viewModel.trigger
    }
    
}
