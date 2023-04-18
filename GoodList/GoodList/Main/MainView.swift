//
//  MainView.swift
//  GoodList
//
//  Created by Joobang on 2023/04/18.
//

import Foundation
import UIKit

import SnapKit

class MainView: UIView{
    
    let constants = Constants()
    
    let segment: UISegmentedControl = {
        let segmentItems = SegmentItem.allCases.map { $0.rawValue }
        let segment = UISegmentedControl(items: segmentItems)
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(segment)
        addSubview(tableView)
        
        segment.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(constants.autolayout.segmentTop)
            make.leading.equalToSuperview().offset(constants.autolayout.segmentHorizon)
            make.trailing.equalToSuperview().offset(-constants.autolayout.segmentHorizon)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segment.snp.bottom).offset(constants.autolayout.tableviewTop)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
}
