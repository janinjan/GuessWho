//
//  UIViewController+Extension.swift
//  GuessWho
//
//  Created by Janin Culhaoglu on 24/01/2021.
//

import UIKit

extension UIViewController {

    static func instantiateStoryboard<T>(withName name: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        // swiftlint:disable force_cast
        let controller = (storyboard.instantiateViewController(identifier: "\(T.self)") as! T)
        // swiftlint:enable force_cast
        return controller
    }
}
