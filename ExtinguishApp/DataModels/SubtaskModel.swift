//
//  SubtaskModel.swift
//  Extinguish-New
//
//  Created by Tanvi Gupta on 07/03/23.
//

import Foundation

struct Subtask : Identifiable, Decodable  {
    var id: Int?
    var subtaskId : Int
    var stockName : String
    var pid : Int
    var batchNo : Int
    var mfgDate : String
    var expDate : String
    var noOfCases : Int
    var pieces : Int
    var outer : Int
}

struct SubtaskSend : Encodable , Decodable {
    var id: Int?
    var stockName : String
    var pid : Int
    var batchNo : Int
    var mfgDate : String
    var expDate : String
    var noOfCases : Int
    var pieces : Int
    var outer : Int
}
