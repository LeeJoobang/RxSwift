//
//  AddTaskView.swift
//  GoodList
//
//  Created by Joobang on 2023/04/18.
//

import Foundation
import UIKit

import SnapKit

class AddTaskView: UIView{
    
    let segment: UISegmentedControl = {
        let segmentItems = SegmentItem.allCases.filter { $0 != .all }.map{$0.rawValue}
        let segment = UISegmentedControl(items: segmentItems)
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    let textfield: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .gray
        textfield.borderStyle = .roundedRect
        return textfield
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
        addSubview(textfield)
        
        segment.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        textfield.snp.makeConstraints { make in
            make.top.equalTo(segment.snp.bottom).offset(100)
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
    }
    
    
}
