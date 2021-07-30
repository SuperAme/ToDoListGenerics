//
//  AddNewItemViewController.swift
//  ToDoListGenerics
//
//  Created by IDS Comercial on 20/07/21.
//

import UIKit
import CoreData

protocol AddNewItemViewControllerDelegate: class {
    func saveNewItem(item: String)
}

final class AddNewItemViewController: UIViewController {
    weak var delegate: AddNewItemViewControllerDelegate?
    
    private lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        v.text = "add New"
        v.textColor = .darkGray
        v.numberOfLines = 0
        return v
    }()
    
    private lazy var titleField: UITextField = {
        let v = UITextField()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.borderStyle = .roundedRect
        v.placeholder = "Add new Item"
        return v
    }()
    
    private lazy var saveButton: UIButton = {
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.setTitle("Save", for: .normal)
        v.addTarget(self, action: #selector(didTapeSave(_:)), for: .touchUpInside)
        v.setTitleColor(.white, for: .normal)
        v.backgroundColor = .blue
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        [titleLabel, titleField, saveButton].forEach { (v) in
            view.addSubview(v)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        //Title Label
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32)
        ])
        //Title Field
        NSLayoutConstraint.activate([
            titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
        ])
        //button
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveButton.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 16),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func didTapeSave(_ sender: UIButton) {
        guard let text = titleField.text, !text.isEmpty else {
            return
        }
        delegate?.saveNewItem(item: text)
        dismiss(animated: true, completion: nil)
    }
}
