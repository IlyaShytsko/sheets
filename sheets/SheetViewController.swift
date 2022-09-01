//
//  SheetViewController.swift
//  sheets
//
//  Created by Ilya Shytsko on 01.08.2022.
//

import FloatingPanel
import UIKit

final class SheetViewController: FloatingPanelController, FloatingPanelLayout, FloatingPanelBehavior {
    static func instance(contentView: SampleUIViewDelegate, allowFullScreen: Bool = false) -> SheetViewController {
        let vc = SheetViewController()
        vc.subView = contentView
        vc.allowFullScreen = allowFullScreen
        return vc
    }

    // MARK: - Properties

    private var subView: SampleUIViewDelegate!
    private var subViewHeight: Double { subView.contentHeight }

    private var allowFullScreen: Bool = false

    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .half
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] { return setAncors() }

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        layoutView()
        invalidateLayout()
    }

    // MARK: - Initialization

    private func setupView() {
        let subView = subView.contentView.loadNib()
        surfaceView.containerView.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: surfaceView.containerView.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: surfaceView.containerView.trailingAnchor),
            subView.topAnchor.constraint(equalTo: surfaceView.containerView.topAnchor),
            subView.bottomAnchor.constraint(equalTo: surfaceView.containerView.bottomAnchor),
        ])
    }

    private func layoutView() {
        layout = self
        contentMode = .static
        backdropView.dismissalTapGestureRecognizer.isEnabled = true
        isRemovalInteractionEnabled = true
        panGestureRecognizer.isEnabled = true
//        track(scrollView: subView.tableView)

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


    
    // MARK: - Private

    private func setAncors() -> [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return allowFullScreen ? [.full: FloatingPanelLayoutAnchor(absoluteInset: 0.0, edge: .top, referenceGuide: .superview),
                                  .half: FloatingPanelLayoutAnchor(absoluteInset: subViewHeight, edge: .bottom, referenceGuide: .safeArea)] :
            [.half: FloatingPanelLayoutAnchor(absoluteInset: subViewHeight, edge: .bottom, referenceGuide: .safeArea)]
    }
}
