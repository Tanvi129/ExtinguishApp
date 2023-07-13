//
//  AuditorDetailsModel.swift
//  Extinguish-New
//
//  Created by Tanvi Gupta on 07/03/23.
//

import Foundation

struct Auditor : Identifiable, Decodable {
    var id: Int?
    var profile_pic : ProfilePic?
    var auditorId : Int
    var name : String
    var age : Int
    var gender : String
    var address : String
    var phoneNumber : String
    var email: String
    var managerId : Int
    var location : loc
    var password : String
    
//    var assignedTasks : [TaskModel]?
    
}

struct ProfilePic : Decodable {
    var type : String
    var data : Data
    enum CodingKeys: CodingKey {
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        let bytes = try container.decode([Int8].self, forKey: .data)
        self.data = Data(bytes: bytes.lazy.map{UInt8(bitPattern: $0)})
    }
}
