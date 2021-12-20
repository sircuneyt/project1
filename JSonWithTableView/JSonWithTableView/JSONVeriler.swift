//
//  File.swift
//  JSonWithTableView
//
//  Created by Cüneyt ALSU on 16.12.2021.
//

import Foundation
import UIKit

enum Menu: CaseIterable {
    case TRY
    case USD
    case CAD
    case CHF
    case GBP
    case JPY

    var title: String {
        switch self {
            case .TRY :
                return "TRY"
            case .USD :
                return "USD"
            case .CAD :
                return "CAD"
            case .CHF:
                return "CHF"
            case .GBP:
                return "GBP"
            case .JPY:
                return "JPY"
      }
    }
    var value : Double {
        switch self {
            case .TRY :
            let currency = 12345.65
            return currency
            case .USD :
            let currency = exchange(currency: "USD")
            return currency
            case .CAD :
            let currency = exchange(currency: "CAD")
            return currency
            case .CHF:
            let currency = exchange(currency: "CHF")
            return currency
            case .GBP:
            let currency = exchange(currency: "GBP")
            return currency
            case .JPY:
            let currency = exchange(currency: "JPY")
            return currency }
    }
    func exchange(currency: String) -> Double {
      let url = URL(string: "http://data.fixer.io/api/latest?access_key=a7660233df3a1d34e1c443255e6851b8&format=1")!
           let session = URLSession.shared
            let request = URLRequest(url: url)
           let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
               guard error == nil else {
                   return }
               guard let data = data else {
                   return}
               do {
                 if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                     if let rates = json["rates"] as? [String : Any] {
                         guard let value = rates[currency] as? Double else {return 0}
                         print(value)
                         return value
                     }
                 }
              } catch let error {
                print(error.localizedDescription)
              }
           })
        task.resume()
       }
}
            
        
        
//        let url = URL(string: "http://data.fixer.io/api/latest?access_key=d5d6c699906d54350a78f336f4fd0428")
//
//        let session = URLSession.shared
//
//        let task = session.dataTask(with: url!) { data, response, error in
//            if error != nil {
//               print("Hata!")
//            } else {
//                if data != nil {
//                    do {
//                   let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary <String,Any>
//                        DispatchQueue.main.async {
//                            if let rates = jsonResponse["rates"] as? [String : Any] {
//                                let value = rates[currency] as? Double
//                            }
//                        }
//                    } catch {
//                        print("Hata")
//                    }
//            }
//        }
//    }
//        task.resume()
//        return value
    

        
        
        
        
        
        
        
        
        
        
