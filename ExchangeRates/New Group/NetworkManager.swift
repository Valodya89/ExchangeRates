//
//  NetworkManager.swift
//  ExchangeRatesAssignment
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

let BASE_URL = "http://rate.am/ws/mobile/v2/"

typealias CompletionBlock = (_ result : AnyObject?, _ errorDataModel:Error?) -> ()

class NetworkManager: NSObject {

    static let shared = NetworkManager()
    
    func getRequest(urlString: String, complition: @escaping CompletionBlock) {
        
        guard let url = URL(string: BASE_URL+urlString) else { return }
        
        if Reachability.isConnectedToNetwork(){
            print("Internet Connection Available!")
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let error = error {
                    complition(nil,error)
                    return
                }
                
                guard let data = data else { return }
                complition(data as AnyObject,nil)
                
                }.resume()
        }else{
            print("Internet Connection not Available!")
            showAlert()
            return
        }
    }

    func showAlert() {
        
        let alert = UIAlertController(title: "Կապի խափանում!", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
        }))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
