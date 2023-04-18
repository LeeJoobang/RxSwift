//
//  MainViewController.swift
//  GoodList
//
//  Created by Joobang on 2023/04/18.
//

import Foundation
import UIKit

import SnapKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        self.title = Constans.mainTitle
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        setUI()
        addButton()
        
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
        present(navVC, animated: true)
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constans.identifier, for: indexPath)
        cell.textLabel?.text = "textLabel: \(indexPath.row)"
        return cell
    }
}
