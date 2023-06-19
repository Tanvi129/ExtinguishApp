//
//  Users.swift
//  ExtinguishApp
//
//  Created by Tanvi Gupta on 18/06/23.
//

import Foundation
struct User: Identifiable, Decodable {
    var exists: Bool
    var who : String
    var id : Int
}
