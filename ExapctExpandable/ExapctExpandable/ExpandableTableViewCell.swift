//
//  ExpandableTableViewCell.swift
//  ExapctExpandable
//
//  Created by Morse on 9/24/22.
//

import UIKit

class ExpandableTableViewCell: UITableViewCell {
    private let containerStackView = UIStackView()
    private let titleLabel = UILabel()
    private let titleView = UIView()
    private let bottomLabel = UILabel()
    let bottomView = UIView()
    
    static let reuseIdentifier = "ExpandableCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ExpandableTableViewCell.reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    private func configure() {
        contentView.addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(titleView)
        containerStackView.addArrangedSubview(bottomView)
        containerStackView.axis = .vertical
        
        titleView.addSubview(titleLabel)
        bottomView.addSubview(bottomLabel)
        
        bottomLabel.text = "One two three four five six seven eight nine ten eleven twelve"
        bottomView.isHidden = false
        
        containerStackView.pinToEdges(of: contentView)
        
    }
}

extension UIView {
    func pinToEdges(of superView: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
}
