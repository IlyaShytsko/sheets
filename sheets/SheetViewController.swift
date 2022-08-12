//
//  SheetViewController.swift
//  sheets
//
//  Created by Ilya Shytsko on 01.08.2022.
//

import FloatingPanel
import UIKit

final class SheetViewController: FloatingPanelController {
    static func instance(subView: UIView) -> SheetViewController {
        let vc = SheetViewController()
        vc.subView = subView.loadNib()
        return vc
    }

    private var subView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        surfaceView.containerView.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: surfaceView.containerView.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: surfaceView.containerView.trailingAnchor),
            subView.topAnchor.constraint(equalTo: surfaceView.containerView.topAnchor),
            subView.bottomAnchor.constraint(equalTo: surfaceView.containerView.bottomAnchor),
        ])
        
        layoutView()
        invalidateLayout()
    }

    private func layoutView() {
        layout = MyFloatingPanelLayout()
        contentMode = .fitToBounds
        backdropView.dismissalTapGestureRecognizer.isEnabled = true
        isRemovalInteractionEnabled = true
        panGestureRecognizer.isEnabled = true

        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black.withAlphaComponent(0.15)
        shadow.offset = CGSize(width: 0, height: 2)
        shadow.radius = 10
        shadow.opacity = 1

        surfaceView.appearance.cornerRadius = 16
        surfaceView.appearance.shadows = [shadow]
        surfaceView.grabberHandle.isHidden = true
    }
}

class MyFloatingPanelLayout: FloatingPanelLayout, setHeightProtocol {
    func setContentHeight(height: Double) {
        contentHeight = height
    }

    var contentHeight = 130.0 {
        didSet {
            print("contentHeight", contentHeight)
        }
    }

    var position: FloatingPanelPosition = .bottom
    var initialState: FloatingPanelState = .half
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
//            .full: FloatingPanelLayoutAnchor(absoluteInset: 0.0, edge: .top, referenceGuide: .superview),
            .half: FloatingPanelLayoutAnchor(absoluteInset: contentHeight, edge: .bottom, referenceGuide: .safeArea),
        ]
    }

    func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
        switch state {
        case .full, .half: return 0.1
        default: return 0.0
        }
    }
}
