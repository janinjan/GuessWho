//
//  Coordinator.swift
//  GuessWho
//
//  Created by Janin Culhaoglu on 24/01/2021.
//

import UIKit

protocol Coordinator: class {
    func start()
}

protocol ParentCoordinator: Coordinator {
    var childCoordinators: [Coordinator] { get set }
    func childDidFinish(_ child: Coordinator)
}

extension ParentCoordinator {
    func removeChild(_ child: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool
            in
            return child === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
