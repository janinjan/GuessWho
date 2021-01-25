//
//  QuoteCoordinator.swift
//  GuessWho
//
//  Created by Janin Culhaoglu on 24/01/2021.
//

import UIKit

enum QuoteStoryboardScene: String {
    case quote = "Quote"
    case detail = "QuoteDetail"
}

enum Event {
    case detailButtonTapped
    // Add other event cases here
}

final class QuoteCoordinator: ParentCoordinator {

    // MARK: - Properties

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func start() {
        let quoteViewController: QuoteViewController =
            .instantiateStoryboard(withName: QuoteStoryboardScene.quote.rawValue)
        quoteViewController.coordinator = self

        navigationController.setViewControllers([quoteViewController], animated: true)
        navigationController.navigationBar.prefersLargeTitles = true
    }

    func eventOccured(with type: Event) {
        switch type {
        case .detailButtonTapped:
            showDetailView()
        }
    }

    private func showDetailView() {
        let detailViewController: QuoteDetailViewController =
            .instantiateStoryboard(withName: QuoteStoryboardScene.detail.rawValue)
        detailViewController.coordinator = self

        navigationController.pushViewController(detailViewController, animated: true)
    }

    func childDidFinish(_ child: Coordinator) {
        removeChild(child)
    }
}
