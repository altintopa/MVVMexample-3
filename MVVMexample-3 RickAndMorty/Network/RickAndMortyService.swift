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
         isSuccess: @escaping ([RickAndMortyModel]) -> Void,
         isError: @escaping (String) -> Void
         )
}

class RickAndMortyService : RickAndMortyServiceProtocol {
    func fetchAllData(isSuccess: @escaping ([RickAndMortyModel]) -> Void, isError: @escaping (String) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URL(string: ServiceConstants.RickUrl.url.rawValue)!) { (data, response, error) in
            if error != nil {
                print("Nope !")
            }else {
                if data != nil {
                    do {
                        let response = try JSONDecoder().decode([RickAndMortyModel].self, from: data!)
                        isSuccess(response)
                    }
                    catch {
                        print(" NOOO !")
                        isError(ServiceConstants.Error.error.rawValue)
                    }
                }
            }
        }
        task.resume()
    }
}
