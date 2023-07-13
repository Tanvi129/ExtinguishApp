//
//  Network.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 18/06/23.
//

import Foundation

@MainActor
class Network: ObservableObject {
    @Published var user : User? = nil
    @Published var isLoggedIn = false
    @Published var isBusy = false
    
    
    
    func getUser(email : String , password : String )  {
        guard let url = URL(string: "http://localhost:3000/login/\(email)&\(password)") else { fatalError("Missing URL") }

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
                        self.isLoggedIn = true
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
        
    }
    
    func signOut() async {
        self.isBusy = true
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            self.isLoggedIn = false
            self.isBusy = false
        }catch{
            print("Loggout faiure")
        }
    }

}
