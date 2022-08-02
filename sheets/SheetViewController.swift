//
//  SheetViewController.swift
//  sheets
//
//  Created by Ilya Shytsko on 01.08.2022.
//

import FloatingPanel
import UIKit

final class SheetViewController: FloatingPanelController, ContentHeightProtocol {
    static func instance(childViewController: UIViewController) -> SheetViewController {
        let vc = SheetViewController()
        vc.childViewController = childViewController
        return vc
    }

    private var childViewController: UIViewController!

    private var contentHeight: Double = 0.0 {
        didSet {
            print("contentHeight =", contentHeight)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
        set(contentViewController: childViewController)
        invalidateLayout()
    }

    private func layoutView() {
        layout = MyFloatingPanelLayout()
        contentMode = .static
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

    func layout(height: Double) {
        contentHeight = height
    }
}

class MyFloatingPanelLayout: FloatingPanelLayout {
    var position: FloatingPanelPosition = .bottom
    var initialState: FloatingPanelState = .half
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
//            .full: FloatingPanelLayoutAnchor(absoluteInset: 0.0, edge: .top, referenceGuide: .superview),
            .half: FloatingPanelLayoutAnchor(absoluteInset: 250, edge: .bottom, referenceGuide: .safeArea),
        ]
    }

    func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
        switch state {
        case .full, .half: return 0.1
        default: return 0.0
        }
    }
}
