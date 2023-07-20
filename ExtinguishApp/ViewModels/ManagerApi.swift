//
//  ManagerApi.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 19/06/23.
//

import Foundation
import SwiftUI

class ManagerApi: ObservableObject  {
    

    func getManagerDetails(id : Int ) async throws -> Manager {
        guard let url = URL(string: "http://localhost:3000/managers/\(id)") else { fatalError("Missing URL") }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print("Data manager",data)
      

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decodedManager = try JSONDecoder().decode(Manager.self, from: data)
        return decodedManager
    }
    
    func getListOfAuditorsUnderManger(id : Int ) async throws -> [Auditor] {
        guard let url = URL(string: "http://localhost:3000/myAuditors/\(id)") else { fatalError("Missing URL") }
    
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
        

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            print("Data ", data)
        let auditorList = try JSONDecoder().decode([Auditor].self, from: data)
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
    
    func performAddTaskPOSTRequest(task : TaskModel) {
        // Replace "your-api-endpoint" with the actual API endpoint where you want to send the POST request.
        let apiUrlString = "http://localhost:3000/tasks"
        
        // Create your data to be sent in the request.
        let taskdata = task
        
        // Create a URLRequest with the API URL.
        guard let url = URL(string: apiUrlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        
        // Set the request method to POST.
        request.httpMethod = "POST"
        
        // Set the request header if needed (e.g., Content-Type).
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Encode your data into JSON format.
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(taskdata)
            request.httpBody = jsonData
        } catch {
            print("Error encoding data: \(error)")
            return
        }
        
        // Create a URLSession and send the request.
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // Handle the response here.
            if let data = data {
                // Parse the response data if needed.
                do {
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(TaskModel.self, from: data)
                    print("Response: \(responseModel)")
                } catch {
                    print("Error decoding response: \(error)")
                }
            }
        }
        
        // Start the task.
        task.resume()
    }

}
