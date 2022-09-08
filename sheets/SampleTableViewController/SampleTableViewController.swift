//
//  SampleTableViewController.swift
//  sheets
//
//  Created by Ilya Shytsko on 08.09.2022.
//

import UIKit

final class SampleTableViewController: BaseContentViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var conteinerView: UIView!
    
    override var baseTableView: UITableView? { tableView }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SampleTableViewCell", bundle: nil), forCellReuseIdentifier: "SampleTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension SampleTableViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath) as! SampleTableViewCell
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension SampleTableViewController: SheetContentViewProtocol {
    var contentHeight: Double { 300.0 }
    var allowFullScreen: Bool { true }
    var contentViewController: BaseContentViewController { self }
}
