//
//  AddTaskViewController.swift
//  GoodList
//
//  Created by Joobang on 2023/04/18.
//

import Foundation
import UIKit

import RxSwift
import RxCocoa

class AddTaskViewController: UIViewController{
    
    let addTaskView = AddTaskView()
    let constants = Constants()
    
    let taskInfo = PublishSubject<(String, SegmentItem)>()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = constants.addTaskTitle
        setUI()
        saveButton()
    }
    
    func setUI(){
        view.addSubview(addTaskView)
        addTaskView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func saveButton(){
        let button = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonClicked))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func saveButtonClicked(){
        let selectedIndex = addTaskView.segment.selectedSegmentIndex
        let segmentValue = SegmentItem.allCases.filter { $0 != .all}[selectedIndex]
        guard let taskText = addTaskView.textfield.text, !taskText.isEmpty else {
            print("textfield text is empty")
            return
        }
        taskInfo.onNext((taskText, segmentValue))
        dismiss(animated: true)
    }
}
