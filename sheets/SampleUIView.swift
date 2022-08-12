//
//  sampleUIView.swift
//  sheets
//
//  Created by Ilya Shytsko on 11.08.2022.
//

import UIKit

final class SampleUIView: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!

    private var heightProtocol: setHeightProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        heightProtocol = MyFloatingPanelLayout()
        heightProtocol?.setContentHeight(height: containerView.frame.height)
    }

    @IBAction func buttonAction(_ sender: Any) {
        print("hello!")
    }
}
