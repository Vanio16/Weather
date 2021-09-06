//
//  StackView.swift
//  City
//
//  Created by Ivan Zakharov on 20/8/21.
//

import Foundation
import UIKit
import Framezilla

class CollectionViewCell: UICollectionViewCell {
    private struct Constants {
        static let cityLabelLeftInset: CGFloat = 4
    }

    private let cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    private let view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        add(view, cityLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        cityLabel.configureFrame { maker in
            maker.centerY()
                .left(inset: Constants.cityLabelLeftInset)
                .sizeToFit()
        }
        view.configureFrame { maker in
            maker.top()
                .bottom()
                .right()
                .left()
        }
    }

    func refreshContent(_ city: City) {
        cityLabel.text = city.name
    }
}
