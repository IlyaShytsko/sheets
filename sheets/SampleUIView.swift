//
//  sampleUIView.swift
//  sheets
//
//  Created by Ilya Shytsko on 11.08.2022.
//

import FloatingPanel
import UIKit

final class SampleUIView: UIView {
    @IBOutlet weak var conteinerView: UIView!

    private var sheetView: SubViewHeight?

    override public func awakeFromNib() {
        super.awakeFromNib()
        sheetView = SheetViewController()
        sheetView?.setViewHeight(height: conteinerView.frame.height + 16.0)
    }

    @IBAction func buttonAction(_ sender: Any) {
    }
}
