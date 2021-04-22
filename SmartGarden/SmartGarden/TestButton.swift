//
//  TestButton.swift
//  SmartGarden
//
//  Created by Oscar de Jesus Hernandez Escobedo on 21/04/21.
//  Copyright © 2021 E-Nexus. All rights reserved.
//

import UIKit

struct TestButtonViewModel{
    let primaryText: String
    let secundaryText: String
}

final class TestButton: UIButton {
    
    private var primaryLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }
    
    private var secundaryLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(primaryLabel)
        addSubview(secundaryLabel)
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1
        if #available(iOS 13.0, *) {
            layer.borderColor = UIColor.secondarySystemBackground.cgColor
        } else {
            // Fallback on earlier versions
        }
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: TestButtonViewModel){
        primaryLabel.text = viewModel.primaryText
        secundaryLabel.text = viewModel.secundaryText
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        primaryLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        secundaryLabel.frame = CGRect(x: 0, y: frame.size.height/2, width: frame.size.width, height: frame.size.height)
    }

}
