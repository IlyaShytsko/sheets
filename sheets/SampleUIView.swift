//
//  sampleUIView.swift
//  sheets
//
//  Created by Ilya Shytsko on 11.08.2022.
//

import UIKit

final class SampleUIView: UIView, SampleUIViewDelegate {
    
    var contentHeight: Double { 180.0 }
    var contentView: UIView { return self }
    
///возвращает 0...
    private func sizeThatFits() -> Double {
        let targetSize = CGSize(width: frame.size.width, height: UIView.layoutFittingExpandedSize.height)
        return systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
    }
}
