//
//  MainViewController.swift
//  GoodList
//
//  Created by Joobang on 2023/04/18.
//

import Foundation
import UIKit

import SnapKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    let mainView = MainView()
    let constants = Constants()
    
    let disposeBag = DisposeBag()
    
    var taskInfo = [(String, SegmentItem)]()
    var selectedSegment: SegmentItem = .all
    
    var filteredSelectedItem: [(String, SegmentItem)] {
        if selectedSegment == .all{
            return taskInfo
        } else {
            return taskInfo.filter { $0.1 == selectedSegment}
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        self.title = constants.mainTitle
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        setUI()
        addButton()
        
        mainView.segment.addTarget(self, action: #selector(segmentChanged) , for: .valueChanged)
    }
    
    @objc func segmentChanged(){
        let index = mainView.segment.selectedSegmentIndex
        selectedSegment = SegmentItem.allCases[index]
        mainView.tableView.reloadData()
    }
    
    
    
    func setUI(){
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func addButton(){
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func addButtonClicked(){
        print("clicked the button")
        let addTaskViewController = AddTaskViewController()
        let navVC = UINavigationController(rootViewController: addTaskViewController)
        
        addTaskViewController.taskInfo
            .subscribe(onNext: {[weak self] tasktext, segmentValue in
                print("taskText: \(tasktext)")
                print("segment: \(segmentValue)")
                self?.taskInfo.append((tasktext, segmentValue))
                self?.mainView.tableView.reloadData()
            }).disposed(by: disposeBag)
        present(navVC, animated: true)
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSelectedItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: constants.identifier, for: indexPath)
        let task = filteredSelectedItem[indexPath.row]
        cell.textLabel?.text = task.0
        return cell
    }
}
