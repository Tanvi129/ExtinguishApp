//
//  CommonApi.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 28/06/23.
//

import Foundation

class CommonApi : ObservableObject {
    
    func getListOfSubtask(taskId : Int ) async throws -> [Subtask] {
        guard let url = URL(string: "http://localhost:3000/listOfTasks/subTasks/\(taskId)") else { fatalError("Missing URL") }
    
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
        

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            print("Data ", data)
        let subtaskList = try JSONDecoder().decode([Subtask].self, from: data)
        print("Length of list is ", subtaskList.count)
        return subtaskList
    }
}
