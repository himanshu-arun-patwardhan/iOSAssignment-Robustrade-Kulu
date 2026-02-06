//
//  APIService.swift
//  iOSAssignment-Robustrade-Kulu
//
//  Created by Himanshu Patwardhan on 06/02/26.
//

import Foundation

protocol APIServiceProtocol {
    func fetchProducts(page: Int, completion: @escaping (Result<ProductResponse, Error>) -> Void)
}

final class APIService: APIServiceProtocol {
    
    func fetchProducts(page: Int, completion: @escaping (Result<ProductResponse, Error>) -> Void) {
        
        let urlString = "https://fakeapi.net/products?page=\(page)&limit=10&category=electronics"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data else { return }
            
            do {
                let decoded = try JSONDecoder().decode(ProductResponse.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
            
        }
        .resume()
        
    }
    
}
