//
//  AddTaskViewController.swift
//  GoodList
//
//  Created by Joobang on 2023/04/18.
//

import Foundation
import UIKit

class AddTaskViewController: UIViewController{
    
    let addTaskView = AddTaskView()
    
    let constants = Constants()
    
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
        print("clicked the button")
    }

    
}
