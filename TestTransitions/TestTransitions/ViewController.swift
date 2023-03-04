//
//  ViewController.swift
//  TestTransitions
//
//  Created by Morse on 8/10/22.
//

import UIKit

class ViewController: UIViewController {
    let contentView = UIView()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let titles = ["Federal Taxes1", "State Taxes", "MED/EE", "OASDI/EE", "Add'l Taxes", "MED/EE", "OASDI/EE", "Add'l Taxes", "MED/EE", "OASDI/EE", "Add'l Taxes", "MED/EE", "OASDI/EE", "Add'l Taxes", "MED/EE", "OASDI/EE", "Add'l Taxes", "MED/EE", "OASDI/EE", "Add'l Taxes", "MED/EE", "OASDI/EE", "Add'l Taxes", "MED/EE", "OASDI/EE", "Add'l Taxes", "MED/EE", "OASDI/EE", "Add'l Taxes", "MED/EE", "OASDI/EE", "Add'l Taxes", "MED/EE", "OASDI/EE", "Add'l Taxes", "MED/EE", "OASDI/EE", "LAST ONE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        addContentView()
        addScrollView()
        addStackView()
    }
    
    func addContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .brown
        contentView.layer.cornerRadius = 30
        
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30)
        ])
//        contentView.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
    func addScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemPink
        scrollView.contentSize = CGSize(width: stackView.frame.size.width, height: stackView.frame.size.height)
        contentView.addSubview(scrollView)
//        scrollView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -0),
            
//            contentView.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            
//            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
//            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
//            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
//            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

    func addStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        for title in titles {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = .yellow
            label.text = title
            stackView.addArrangedSubview(label)
        }
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            
//            contentView.heightAnchor.constraint(equalTo: stackView.heightAnchor, constant: 50)
        ])
    }
}

class NewViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
