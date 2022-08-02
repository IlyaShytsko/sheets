//
//  ViewController.swift
//  sheets
//
//  Created by Ilya Shytsko on 01.08.2022.
//

import FloatingPanel
import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }

    @IBAction func showSheetButton(_ sender: Any) {
        let vc = SheetViewController.instance(childViewController: StaticViewController.instance())
        present(vc, animated: true)
    }
}
