//
//  MyStackView.swift
//  StackViewEx
//
//  Created by 김종권 on 2021/08/20.
//

import UIKit

class MyStackView: BaseStackView {

    var title: String? { didSet { bind() } }
    var subTitle: String? { didSet { bind() } }

    private let pointyWidth: CGFloat = 8
    private let pointyHeight: CGFloat = 8

    private lazy var bubbleStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center

        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 5.0, left: 12.0, bottom: 5.0, right: 12.0)
        view.backgroundColor = .lightGray

        view.layer.cornerRadius = 14.0
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 3.0

        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.textColor = .white

        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = subTitle
        label.textColor = .blue

        return label
    }()

    private lazy var pointyView: UIView = {
        let view = UIView()

        return view
    }()

    init(title: String?, subTitle: String?) {
        self.title = title
        self.subTitle = subTitle

        super.init(frame: .zero)
    }

    override func configure() {
        super.configure()

        backgroundColor = .clear
        axis = .vertical
        alignment = .center

        addSubviews()
        bind()
    }

    private func addSubviews() {
        addArrangedSubview(bubbleStackView)
        bubbleStackView.addArrangedSubview(titleLabel)
        addArrangedSubview(pointyView)
        addArrangedSubview(subTitleLabel)
    }

    override func bind() {
        super.bind()

        var frameWidth: CGFloat = 0.0
        var frameHeight: CGFloat = 0.0

        if let title = title {
            titleLabel.isHidden = false
            pointyView.isHidden = false
            titleLabel.text = title
            titleLabel.sizeToFit()

            frameWidth = titleLabel.intrinsicContentSize.width
            frameHeight = titleLabel.intrinsicContentSize.height

            setPointyShapeLayerAtBubbleStackView()
            setCustomSpacing(8, after: pointyView)
        } else {
            titleLabel.isHidden = true
            pointyView.isHidden = true
        }

        if let subTitle = subTitle {
            subTitleLabel.text = subTitle
            subTitleLabel.sizeToFit()

            frameWidth = max(frameWidth, subTitleLabel.intrinsicContentSize.width)
            frameHeight = max(frameHeight, subTitleLabel.intrinsicContentSize.height)
        }

        frame.size = CGSize(width: frameWidth, height: frameHeight)

        sizeToFit()
    }

    private func setPointyShapeLayerAtBubbleStackView() {
        let path = CGMutablePath()

        path.move(to: CGPoint(x: -pointyWidth / 2, y: 0))
        path.addLine(to: CGPoint(x: 0, y: pointyHeight))
        path.addLine(to: CGPoint(x: pointyWidth / 2, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.fillColor = UIColor.gray.cgColor

        shapeLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        shapeLayer.shadowOpacity = 0.1
        shapeLayer.shadowRadius = 3.0

        pointyView.layer.insertSublayer(shapeLayer, at: 0)
    }
}
