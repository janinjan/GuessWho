//
//  TabBarCoordinator.swift
//  GuessWho
//
//  Created by Janin Culhaoglu on 24/01/2021.
//

import UIKit

final class TabBarCoordinator: NSObject, ParentCoordinator {

    // MARK: - Properties

    private var tabBarController: UITabBarController
    var childCoordinators: [Coordinator] = []

    var quoteCoordinator: QuoteCoordinator
    var settingsCoordinator: SettingsCoordinator

    // MARK: - Initializer

    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController

        quoteCoordinator = QuoteCoordinator(navigationController: UINavigationController())
        settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())
        super.init()
        tabBarController.delegate = self
    }

    // MARK: - Methods

    func start() {
        quoteCoordinator.start()
        settingsCoordinator.start()

        childCoordinators.append(quoteCoordinator)
        childCoordinators.append(settingsCoordinator)

        let quoteViewController = setupQuoteViewController()
        let settingsViewController = setupSettingsViewController()

        tabBarController.setViewControllers([quoteViewController, settingsViewController],
                                            animated: false)
        tabBarController.tabBar.isTranslucent = false
        tabBarController.selectedViewController = quoteViewController
    }

    private func setupQuoteViewController() -> UIViewController {
        let quoteViewController = quoteCoordinator.navigationController
        quoteViewController.tabBarItem = UITabBarItem(
            title: "Quote",
            image: UIImage(systemName: "quote.bubble"),
            selectedImage: UIImage(systemName: "quote.bubble.fill")
        )

        return quoteViewController
    }

    private func setupSettingsViewController() -> UIViewController {
        let settingsViewController = settingsCoordinator.navigationController
        settingsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)

        return settingsViewController
    }

    func childDidFinish(_ child: Coordinator) {
        removeChild(child)
    }
}

extension TabBarCoordinator: UITabBarControllerDelegate {

}
