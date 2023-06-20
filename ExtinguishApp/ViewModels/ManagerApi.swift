//
//  ManagerApi.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 19/06/23.
//

import Foundation
import SwiftUI

class ManagerApi: ObservableObject  {
    var isLoading = false
    
    
    
//    var managerProfile : Manager? = nil
//    init(){
//        managerProfile = getManagerProfile()
//    }
//    func getManagerProfile() -> Manager?  {
//        isLoading = true
//        var manager : Manager? = nil
//        guard let url = URL(string: "http://54.179.205.206/managers/76543") else { fatalError("Missing URL") }
//
//        let urlRequest =  URLRequest(url: url)
//
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse else { return }
//
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedUsers = try JSONDecoder().decode(Manager.self, from: data)
//                        manager = decodedUsers
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
//            }
//        }

//        dataTask.resume()
//        self.isLoading = false
//        return manager
//    }
    func getRandomFood(id : Int ) async throws -> Manager {
        guard let url = URL(string: "http://54.179.205.206/managers/\(id)") else { fatalError("Missing URL") }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decodedManager = try JSONDecoder().decode(Manager.self, from: data)
        print("Async decodedFood", decodedManager)
        return decodedManager
    }
    
}
