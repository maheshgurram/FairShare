//
//  RowItem.swift
//  LensReceiptsDemo
//
//  Created by Mahesh on 11/8/23.
//

import Foundation

public struct RowItem: Codable {
    
    public var text: String?
    public var total: Double?
    public var quantity: Int?
    public var description: String?
    public var totalUsers: Int?
    public var assignedUsers: [Contact]? = []
    public var perPersonPrice: Double?
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case total = "total"
        case quantity = "quantity"
        case description = "description"
        case totalUsers = "totalUsers"
        case assignedUsers = "assignedUsers"
        case perPersonPrice = "perPersonPrice"
    }
    
}

extension RowItem {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        text = try container.decodeIfPresent(String.self, forKey: .text)
        total = try container.decodeIfPresent(Double.self, forKey: .total)
        quantity = try container.decodeIfPresent(Int.self, forKey: .quantity)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        totalUsers = try container.decodeIfPresent(Int.self, forKey: .totalUsers)
        assignedUsers = try container.decodeIfPresent([Contact].self, forKey: .assignedUsers)
        if assignedUsers == nil {
            assignedUsers = []
        }
        perPersonPrice = try container.decodeIfPresent(Double.self, forKey: .perPersonPrice)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(total, forKey: .total)
        try container.encodeIfPresent(quantity, forKey: .quantity)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(totalUsers, forKey: .totalUsers)
        try container.encodeIfPresent(assignedUsers, forKey: .assignedUsers)
        try container.encodeIfPresent(perPersonPrice, forKey: .perPersonPrice)
    }
}


