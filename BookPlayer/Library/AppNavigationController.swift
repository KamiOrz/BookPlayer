//
//  AppNavigationController.swift
//  BookPlayer
//
//  Created by Gianni Carlo on 12/21/18.
//  Copyright © 2018 Tortuga Power. All rights reserved.
//

import Themeable
import UIKit

class AppNavigationController: UINavigationController {
    private var themedStatusBarStyle: UIStatusBarStyle?

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return themedStatusBarStyle ?? super.preferredStatusBarStyle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTheming()
    }
}

extension AppNavigationController: Themeable {
    func applyTheme(_ theme: Theme) {
        self.themedStatusBarStyle = theme.background.isDark
            ? .lightContent
            : .default
        setNeedsStatusBarAppearanceUpdate()

        navigationBar.barTintColor = theme.background
        navigationBar.tintColor = theme.tertiary
        navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: theme.primary
        ]
        if #available(iOS 11.0, *) {
            navigationBar.largeTitleTextAttributes = [
                NSAttributedStringKey.foregroundColor: theme.primary
            ]
        }
    }
}
