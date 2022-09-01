//
//  SampleUIViewDelegate.swift
//  sheets
//
//  Created by Ilya Shytsko on 24.08.2022.
//

import UIKit

protocol SampleUIViewDelegate: AnyObject {
    var contentHeight: Double { get }
    var contentView: UIView { get }
}
