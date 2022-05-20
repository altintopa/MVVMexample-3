//
//  RickAndMortyService.swift
//  MVVMexample-3 RickAndMorty
//
//  Created by Ahmet WOW on 20/05/2022.
//

import Foundation
import UIKit

protocol RickAndMortyServiceProtocol {
    func fetchAllData(
         onSuccess: @escaping ([RickAndMortyModel]) -> Void,
         onError: @escaping (String) -> Void
         )
}

class RickAndMortyService : RickAndMortyServiceProtocol {
    func fetchAllData(onSuccess: @escaping ([RickAndMortyModel]) -> Void, onError: @escaping (String) -> Void) {
        
        //let session = URLSession.shared
        let url = URL(string: ServiceConstants.RickUrl.url.rawValue)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("skdnf")
            }else {
                if data != nil {
                    do {
                        let response = try JSONDecoder().decode([RickAndMortyModel].self, from: data!)
                        
                    }
                    catch {
                        print(" NOOO !")
                    }
                }
            }
        }
        task.resume()
    }
    
}
