//
//  ViewController.swift
//  StackViewEx
//
//  Created by 김종권 on 2021/08/20.
//

import UIKit

class ViewController: UIViewController {

    lazy var stackView: MyStackView = {
        let view = MyStackView(title: "타이틀", subTitle: "서브 타이틀")

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
