//
//  ManagerApi.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 19/06/23.
//

import Foundation
import SwiftUI

class ManagerApi: ObservableObject {
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
        print("Task started tasklist")
        guard let url = URL(string: "http://localhost:3000/tasks/manager/\(id)") else { fatalError("Missing URL") }
    
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        print("Task started tasklist between")
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            print("Data ", data)
        let taskList = try JSONDecoder().decode([TaskModel].self, from: data)
        print("Length of task list is ", taskList.count)
        print(taskList)
        print("Task ended tasklist")
        return taskList
    }
    
    func performAddRequestTask(task : TaskModel) async throws -> Int {
        let apiUrlString = "http://localhost:3000/tasks"
        
        let taskDetail = task
        
        guard let url = URL(string: apiUrlString) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(task)
        request.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
            let decoder = JSONDecoder()
            let responseModel = try decoder.decode(TaskModel.self, from: data)
            return responseModel.taskId!
        } else {
            throw URLError(.badServerResponse)
        }
    }
    
    func performAddRequestSubtask(taskid : Int , subtask : SubtaskSend) async throws {
        let apiUrlString = "http://localhost:3000/listOfTasks/subTasks/\(taskid)"
        
        let taskDetail = subtask
        
        guard let url = URL(string: apiUrlString) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(subtask)
        request.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
            let decoder = JSONDecoder()
            let responseModel = try decoder.decode(SubtaskSend.self, from: data)
            print(responseModel)
            
        } else {
            throw URLError(.badServerResponse)
        }
    }
    







}
