//
//  Network.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 18/06/23.
//

import Foundation
import SwiftUI

class Network: ObservableObject {
    @Published var user : User? = nil
    var isLoading = true
    
    init(){
//        getUser()
    }
    
    func getUser(email : String , password : String )  {
        guard let url = URL(string: "http://52.77.226.108/login/\(email)&\(password)") else { fatalError("Missing URL") }

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
                        let decodedUsers = try JSONDecoder().decode(User.self, from: data)
                        self.user = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
        self.isLoading = false
    }

}
