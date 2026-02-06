//
//  ProductCell.swift
//  iOSAssignment-Robustrade-Kulu
//
//  Created by Himanshu Patwardhan on 06/02/26.
//

import UIKit

final class ProductCell: UITableViewCell {
    
    static let id = "ProductCell"
    
    private let productImage = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let categoryLabel = UILabel()
    private let priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func setupUI() {
        productImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        productImage.contentMode = .scaleAspectFill
        productImage.clipsToBounds = true
        
        descriptionLabel.numberOfLines = 2
        
        contentView.addSubview(productImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            productImage.widthAnchor.constraint(equalToConstant: 80),
            productImage.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            categoryLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            categoryLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
            
            priceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
            
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: categoryLabel.bottomAnchor, constant: 12)
        ])
    }
    
    
    func configure(_ product: Product) {
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        categoryLabel.text = product.category
        priceLabel.text = "₹\(product.price)"
        productImage.fetchImage(from: product.image)
    }
    
}
