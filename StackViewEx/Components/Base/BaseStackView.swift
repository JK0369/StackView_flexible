//
//  BaseStackView.swift
//  StackViewEx
//
//  Created by 김종권 on 2021/08/20.
//

import UIKit

class BaseStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder: NSCoder) has not been implemented")
    }

    func configure() {}
    func bind() {}
}
