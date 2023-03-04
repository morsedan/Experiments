//
//  ExpandingTableViewCell.swift
//  MoveCells
//
//  Created by Morse on 9/22/22.
//

import UIKit

class ExpandingTableViewCell: UITableViewCell {
    let containerStackView = UIStackView()
    let mainStackView = UIStackView()
    let collapsableView = UIView()
    
    var title: String? {
        didSet {
            textLabel?.text = title
        }
    }
    
    static let reuseID = "MyCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collapsableView.isHidden = true
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        collapsableView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .systemPink
        
        contentView.addSubview(containerStackView)
        containerStackView.axis = .vertical
        containerStackView.spacing = 4
        
        containerStackView.addArrangedSubview(mainStackView)
        containerStackView.addArrangedSubview(collapsableView)
        
        let label = UILabel()
        label.text = title
        label.backgroundColor = .yellow
        mainStackView.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        collapsableView.backgroundColor = .orange
        
        NSLayoutConstraint.activate([
            
            collapsableView.heightAnchor.constraint(equalToConstant: 240),
            
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func toggleSize() {
        self.collapsableView.isHidden = !self.collapsableView.isHidden
    }
}
