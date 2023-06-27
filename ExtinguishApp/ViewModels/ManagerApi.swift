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

    func getManagerDetails(id : Int ) async throws -> Manager {
        guard let url = URL(string: "http://localhost:3000/managers/\(id)") else { fatalError("Missing URL") }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print("Data manager",data)
      

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decodedManager = try JSONDecoder().decode(Manager.self, from: data)
        print("Async decodedFood", decodedManager)
        return decodedManager
    }
    
    func getListOfAuditorsUnderManger(id : Int ) async throws -> [Auditor] {
        guard let url = URL(string: "http://localhost:3000/myAuditors/\(id)") else { fatalError("Missing URL") }
    
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
        

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            print("Data ", data)
        let auditorList = try JSONDecoder().decode([Auditor].self, from: data)
        print("Length of list is ", auditorList.count)
        return auditorList
    }
    
    func getListOfTaskUnderManger(id : Int ) async throws -> [TaskModel] {
        guard let url = URL(string: "http://localhost:3000/tasks/manager/\(id)") else { fatalError("Missing URL") }
    
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
        

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            print("Data ", data)
        let taskList = try JSONDecoder().decode([TaskModel].self, from: data)
        print("Length of list is ", taskList.count)
        return taskList
    }
    
}
