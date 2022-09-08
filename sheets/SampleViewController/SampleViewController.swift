//
//  SampleViewController.swift
//  sheets
//
//  Created by Ilya Shytsko on 07.09.2022.
//

import UIKit

final class SampleViewController: BaseSheetViewController {
    private var delegate: SampleUIViewDelegate?

    @IBOutlet private weak var conteinerView: UIView!

    @IBAction func buttonAction(_ sender: Any) {
        delegate = ViewController()
        delegate?.printText(text: "hello!")
    }
}

extension SampleViewController: SheetContentViewProtocol {
    var contentHeight: Double { sizeThatFits(content: conteinerView) + 16 }
    var allowFullScreen: Bool { false }
    var contentViewController: BaseSheetViewController { self }
}
