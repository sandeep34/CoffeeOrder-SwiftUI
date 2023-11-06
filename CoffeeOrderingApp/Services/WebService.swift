//
//  WebService.swift
//  CoffeeOrderingApp
//
//  Created by Sandeep.Tomar on 11/1/23.
//

import Foundation

class WebService {
    
    func createNewOrder(order: Order,  completion: @escaping (CreateOrderResponse?) -> ()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request) { data, respnse, error in
            
            guard let data = data, error == nil else  {
                completion(nil)
                return
            }
            
             let orderSuccess = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
                completion(orderSuccess)
            }
        }.resume()
    }
    
    func getAllOrder(completion: @escaping ([Order]?) -> ()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else  {
                completion(nil)
                return
            }
            
            let orderData = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(orderData)
            }
        }.resume()
    }
}
