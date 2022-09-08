//
//  ViewController.swift
//  sheets
//
//  Created by Ilya Shytsko on 01.08.2022.
//

import FloatingPanel
import UIKit

final class ViewController: UIViewController, SampleUIViewDelegate {
    @IBAction func showSheetButton(_ sender: Any) {
        let vc = SheetViewController.instance(contentView: SampleTableViewController())
        present(vc, animated: true)
    }

    func printText(text: String) {
        print(text)
    }
}

extension UIView {
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: nil).first as! UIView
        return view
    }
}
