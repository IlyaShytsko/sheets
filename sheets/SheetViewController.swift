//
//  SheetViewController.swift
//  sheets
//
//  Created by Ilya Shytsko on 01.08.2022.
//

import FloatingPanel
import UIKit

final class SheetViewController: FloatingPanelController, FloatingPanelLayout, FloatingPanelBehavior {
    static func instance(contentView: SheetContentViewProtocol) -> SheetViewController {
        let vc = SheetViewController()
        vc.content = contentView
        return vc
    }

    // MARK: - Properties

    private var content: SheetContentViewProtocol!
    private var contentView: BaseSheetViewController { content.contentViewController }

    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .half
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] { return setAncors() }

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
        invalidateLayout()
    }

    // MARK: - Layout

    private func layoutView() {
        set(contentViewController: contentView)
        if contentView.baseTableView != nil {
            track(scrollView: contentView.baseTableView!)
        }

        layout = self
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

    func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
        switch state {
        case .full, .half: return 0.1
        default: return 0.0
        }
    }

    private func setAncors() -> [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return content.allowFullScreen ? [.full: FloatingPanelLayoutAnchor(absoluteInset: 0.0, edge: .top, referenceGuide: .superview),
                                          .half: FloatingPanelLayoutAnchor(absoluteInset: content.contentHeight, edge: .bottom, referenceGuide: .safeArea)] :
            [.half: FloatingPanelLayoutAnchor(absoluteInset: content.contentHeight, edge: .bottom, referenceGuide: .safeArea)]
    }
}
