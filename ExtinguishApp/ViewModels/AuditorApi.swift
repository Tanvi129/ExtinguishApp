//
//  AuditorApi.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 27/06/23.
//

import Foundation
class AuditorApi: ObservableObject  {
    func getAuditorDetails(id : Int ) async throws -> Auditor {
        guard let url = URL(string: "http://localhost:3000/auditors/\(id)") else { fatalError("Missing URL") }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decodedAuditor = try JSONDecoder().decode(Auditor.self, from: data)
        print("Async decodedFood", decodedAuditor)
        return decodedAuditor
    }
}
