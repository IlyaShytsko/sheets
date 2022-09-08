//
//  BaseContentViewController.swift
//  sheets
//
//  Created by Ilya Shytsko on 07.09.2022.
//

import UIKit

class BaseContentViewController: UIViewController {
    var baseTableView: UITableView? { return nil }

    func sizeThatFits(content: UIView) -> Double {
        let targetSize = CGSize(width: content.frame.size.width, height: UIView.layoutFittingExpandedSize.height)
        return content.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
    }
}
