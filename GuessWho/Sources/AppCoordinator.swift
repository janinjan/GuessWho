//
//  AppCoordinator.swift
//  GuessWho
//
//  Created by Janin Culhaoglu on 24/01/2021.
//

import UIKit

final class AppCoordinator: ParentCoordinator {

    // MARK: - Properties

    var rootViewController: UIViewController?
    var childCoordinators: [Coordinator] = []
    private let window: UIWindow

    // MARK: - Initializer

    init(window: UIWindow) {
        self.window = window
    }

    // MARK: - Coordinator

    func start() {
        rootViewController = UITabBarController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()

        // swiftlint:disable force_cast
        let tabCoordinator = TabBarCoordinator(tabBarController: rootViewController as! UITabBarController)
        // swiftlint:enable force_cast

        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }

    func childDidFinish(_ child: Coordinator) {
        removeChild(child)
    }
}
