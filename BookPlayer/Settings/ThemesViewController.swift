//
//  ThemesViewController.swift
//  BookPlayer
//
//  Created by Gianni Carlo on 12/19/18.
//  Copyright © 2018 Tortuga Power. All rights reserved.
//

import Themeable
import UIKit

class ThemesViewController: UITableViewController {
    var items: [Theme]!

    override func viewDidLoad() {
        super.viewDidLoad()

        DataManager.reloadThemes(in: ThemeManager.shared.library)

        self.items = ThemeManager.shared.availableThemes

        setUpTheming()

        self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 1))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeCell", for: indexPath) as! ThemeCellView
        // swiftlint:enable force_cast
        let item = self.items[indexPath.row]

        cell.titleLabel.text = item.title
        cell.showCaseLabel.backgroundColor = item.background
        cell.showCaseLabel.textColor = item.primary
        cell.showCaseLabel.layer.borderColor = item.secondary.cgColor

        cell.accessoryType = item == ThemeManager.shared.currentTheme
            ? .checkmark
            : .none

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]

        ThemeManager.shared.currentTheme = item
    }
}

extension ThemesViewController: Themeable {
    func applyTheme(_ theme: Theme) {
        self.view.backgroundColor = theme.background
        self.tableView.reloadData()
    }
}
