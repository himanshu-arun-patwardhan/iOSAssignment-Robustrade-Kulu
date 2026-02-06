//
//  ViewController.swift
//  iOSAssignment-Robustrade-Kulu
//
//  Created by Himanshu Patwardhan on 06/02/26.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    private let loader = UIActivityIndicatorView(style: .large)
    
    private let viewModel = ViewModel(service: APIService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Products"
        viewModel.delegate = self
        
        setupTable()
        setupLoader()
        viewModel.loadInitial()
    }
    
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.frame = view.bounds
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.id)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        
        view.addSubview(tableView)
    }
    
    private func setupLoader() {
        loader.center = view.center
        view.addSubview(loader)
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.id, for: indexPath) as! ProductCell
        let product = viewModel.products[indexPath.row]
        cell.configure(product)
        viewModel.loadMoreIfNeeded(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailVC(product: viewModel.products[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension ViewController: ViewModelDelegate {
    
    func didStartLoading() {
        loader.startAnimating()
    }
    
    func didUpdateProducts() {
        DispatchQueue.main.async {
            self.loader.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    func didFail(_ error: Error) {
        loader.stopAnimating()
    }
    
}
