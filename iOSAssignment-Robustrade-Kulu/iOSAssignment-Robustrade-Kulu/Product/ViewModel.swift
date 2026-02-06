//
//  ViewModel.swift
//  iOSAssignment-Robustrade-Kulu
//
//  Created by Himanshu Patwardhan on 06/02/26.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func didUpdateProducts()
    func didFail(_ error: Error)
    func didStartLoading()
}


final class ProductViewModel {
    
    private let service: APIServiceProtocol
    weak var delegate: ViewModelDelegate?
    
    private(set) var products: [Product] = []
    
    private var currentPage = 0
    
    private var isLoading = false
    
    private var hasMoreData = true
    
    
    init(service: APIServiceProtocol) {
        self.service = service
    }
    
    
    func loadInitial() {
        currentPage = 0
        hasMoreData = true
        products.removeAll()
        
        fetch(page: currentPage)
    }
    
    func loadMoreIfNeeded(index: Int) {
        guard index == products.count - 1 else { return }
        guard !isLoading else { return }
        guard hasMoreData else { return }
        
        fetch(page: currentPage)
    }
    
    private func fetch(page: Int) {
        isLoading = true
        delegate?.didStartLoading()
        
        service.fetchProducts(page: page) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let response):
                    self?.isLoading = false
                    
                    let newItems = response.data
                    
                    if newItems.isEmpty {
                        self?.hasMoreData = false
                        self?.delegate?.didUpdateProducts()
                        return
                    }
                    
                    self?.products.append(contentsOf: newItems)
                    self?.currentPage += 1
                    self?.delegate?.didUpdateProducts()
                    
                    self?.isLoading = false
                    
                case .failure(let error):
                    self?.delegate?.didFail(error)
                }
                
            }
        }
        
    }
    
}
