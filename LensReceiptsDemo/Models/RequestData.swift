//
//  RequestData.swift
//  LensReceiptsDemo
//
//  Created by Nirali Mehta on 12/10/23.
//

import Foundation

public struct RequestData: Codable {
    
    public var data: [IndividualRequestData]?
    
    enum CodingKeys: String, CodingKey {
        case data = "requests"
    }
    
}

extension RequestData {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent([IndividualRequestData].self, forKey: .data)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(data, forKey: .data)
    }
}

public struct IndividualRequestData: Codable {
    
    public var name: String?
    public var transactionId: Int?
    public var status: String?
    public var transferAmount: Double?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case transactionId = "transactionId"
        case status = "status"
        case transferAmount = "transfer_amount"
    }
    
}

extension IndividualRequestData {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        transactionId = try container.decodeIfPresent(Int.self, forKey: .transactionId)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        transferAmount = try container.decodeIfPresent(Double.self, forKey: .transferAmount)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(transactionId, forKey: .transactionId)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(transferAmount, forKey: .transferAmount)
    }
}

