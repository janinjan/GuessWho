//
//  SettingsCoordinator.swift
//  GuessWho
//
//  Created by Janin Culhaoglu on 24/01/2021.
//

import UIKit

final class SettingsCoordinator: ParentCoordinator {

    // MARK: - Properties

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private let storyboardName = "Settings"

    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func start() {
        let settingsViewController: SettingsViewController =
            .instantiateStoryboard(withName: storyboardName)

        navigationController.setViewControllers([settingsViewController], animated: true)
        navigationController.navigationBar.prefersLargeTitles = true
    }

    func childDidFinish(_ child: Coordinator) {
        removeChild(child)
    }
}
