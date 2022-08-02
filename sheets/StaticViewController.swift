//
//  StaticViewController.swift
//  sheets
//
//  Created by Ilya Shytsko on 01.08.2022.
//

import UIKit

final class StaticViewController: UIViewController {
    static func instance() -> StaticViewController {
        let storyboard = UIStoryboard(name: "Sheet", bundle: nil)
        let identifier = String(describing: StaticViewController.self)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier) as! StaticViewController
        return vc
    }

    private var heightProtocol: ContentHeightProtocol?

    @IBOutlet private weak var conteinerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        heightProtocol = SheetViewController()
        heightProtocol?.layout(height: conteinerView.frame.size.height)
    }

    func getSize() -> Double {
        return conteinerView.frame.height
    }

    @IBAction func firstButton(_ sender: Any) {
        print("StaticViewController button pressed")
    }
}
