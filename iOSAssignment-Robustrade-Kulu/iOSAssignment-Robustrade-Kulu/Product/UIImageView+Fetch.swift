//
//  UIImageView+Fetch.swift
//  iOSAssignment-Robustrade-Kulu
//
//  Created by Himanshu Patwardhan on 06/02/26.
//

import UIKit

extension UIImageView {
    
    func fetchImage(from urlString: String) {
        
        image = UIImage(systemName: "photo") // placeholder
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, _ in
            
            guard
                let data = data,
                let http = response as? HTTPURLResponse,
                http.statusCode == 200,
                let img = UIImage(data: data)
            else { return }
            
            DispatchQueue.main.async {
                self.image = img
            }
            
        }.resume()
    }
}

