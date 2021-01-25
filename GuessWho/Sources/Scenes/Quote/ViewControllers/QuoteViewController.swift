//
//  QuoteViewController.swift
//  GuessWho
//
//  Created by Janin Culhaoglu on 24/01/2021.
//

import UIKit

final class QuoteViewController: UIViewController {

    // MARK: - Properties

    private var viewModel = QuoteViewModel()
    weak var coordinator: QuoteCoordinator?

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
    }

    // MARK: - Actions

    @IBAction func didTapDetailButton(_ sender: UIButton) {
        coordinator?.eventOccured(with: .detailButtonTapped)
    }
}
