//
//  DetailViewController.swift
//  iOSAssignment-Robustrade-Kulu
//
//  Created by Himanshu Patwardhan on 06/02/26.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let product: Product
    
    private let contentView = UIView()
    
    private let productImage = UIImageView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let categoryLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Product Details"
        
        setupUI()
        configureData()
    }
    
    
    private func setupUI() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        productImage.contentMode = .scaleAspectFit
        productImage.clipsToBounds = true
        
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.numberOfLines = 0
        
        priceLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        priceLabel.textColor = .systemGreen
        
        categoryLabel.font = .systemFont(ofSize: 14)
        categoryLabel.textColor = .gray
        
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        
        view.addSubview(contentView)
        
        contentView.addSubview(productImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            productImage.heightAnchor.constraint(equalToConstant: 250),
            
            titleLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 6),
            categoryLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
    private func configureData() {
        titleLabel.text = product.title
        priceLabel.text = "₹\(product.price)"
        categoryLabel.text = product.category
        descriptionLabel.text = product.description
        productImage.fetchImage(from: product.image)
    }
    
}
