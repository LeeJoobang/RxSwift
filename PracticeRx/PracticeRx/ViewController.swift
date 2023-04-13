//
//  ViewController.swift
//  PracticeRx
//
//  Created by Joobang on 2023/04/13.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        _ = Observable.from([1, 2, 3, 4, 5])
    }


}

