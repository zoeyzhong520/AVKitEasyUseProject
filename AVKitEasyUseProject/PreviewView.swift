//
//  PreviewView.swift
//  AVKitEasyUseProject
//
//  Created by zhifu360 on 2019/5/9.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

@objc protocol PreviewViewDelegate: NSObjectProtocol {
    @objc optional
    func play()
}

class PreviewView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.backgroundColor = .white
        tableView.register(PreviewCell.self, forCellReuseIdentifier: BaseTableReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        return tableView
    }()
    
    weak var delegate: PreviewViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(tableView)
    }
    
}

extension PreviewView: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PreviewCell = PreviewCell.createCellWith(tableView: tableView, indexPath: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if delegate != nil {
            delegate?.play?()
        }
    }
    
}


