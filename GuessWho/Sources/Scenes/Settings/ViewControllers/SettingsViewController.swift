//
//  SettingsViewController.swift
//  GuessWho
//
//  Created by Janin Culhaoglu on 24/01/2021.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Properties

    private var viewModel = SettingsViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
    }
}
