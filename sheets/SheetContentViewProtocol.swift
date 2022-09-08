//
//  SheetContentViewProtocol.swift
//  sheets
//
//  Created by Ilya Shytsko on 24.08.2022.
//

import UIKit

protocol SheetContentViewProtocol: AnyObject {
    var contentHeight: Double { get }
    var allowFullScreen: Bool { get }
    var contentViewController: BaseContentViewController { get }
}
