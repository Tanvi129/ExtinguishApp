//
//  ProofApi.swift
//  ExtinguishApp
//
//  Created by Thrishalini on 16/07/23.
//

import Foundation

class ProofApi : ObservableObject {
    
    func getProofsList(auditorId : Int ) async throws -> [ProofsList] {
        guard let url = URL(string: "http://localhost:3000/proofs/\(auditorId)") else { fatalError("Missing URL") }
    
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
        

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            print("Data ", data)
        let proofsList = try JSONDecoder().decode([ProofsList].self, from: data)
        print("Length of list is ", proofsList.count)
        return proofsList
    }
    
    func postProof(auditorId: Int, urlString:String) async throws {


        let parameters: [String: String] = ["url": urlString]

        guard let url = URL(string: "http://localhost:3000/proofs/\(auditorId)/\(urlString)") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
    

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        print("Data ", data)
        
        
//        guard let urlData = urlString.data(using: .utf8) else {
//                fatalError("Failed to convert urlString to Data")
//            }
//
//        print(auditorId)
//        print("URL  :", urlString)
//        print("URL data :", urlData)
//
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//
//        do {
//            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters)
//        } catch {
//            fatalError("Error serializing JSON: \(error)")
//        }
//
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        do {
//            let (data, response) = try await URLSession.shared.data(for: urlRequest)
//
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                fatalError("Error while posting data")
//            }
//
//            print("Data: \(data)")
//        } catch {
//            fatalError("Error sending request: \(error)")
//        }

        
    }

    
}


