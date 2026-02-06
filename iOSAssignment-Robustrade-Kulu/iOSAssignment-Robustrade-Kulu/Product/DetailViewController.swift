//
//  DetailViewController.swift
//  iOSAssignment-Robustrade-Kulu
//
//  Created by Himanshu Patwardhan on 06/02/26.
//

import UIKit

final class ProductDetailVC: UIViewController {
    
    private let product: Product
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
}
