//
//  ManagerApi.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 19/06/23.
//

import Foundation

class ManagerApi: ObservableObject {
    var isLoading = true
    
    func getUser(id : Int) -> Manager?  {
        var manager : Manager? = nil
        guard let url = URL(string: "http://13.212.103.64/managers/\(id)") else { fatalError("Missing URL") }

        let urlRequest =  URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(Manager.self, from: data)
                        var manager = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
        self.isLoading = false
        return manager
    }
}
