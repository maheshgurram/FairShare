//
//  Contact.swift
//  LensReceiptsDemo
//
//  Created by Mahesh on 11/9/23.
//

import Foundation

public struct Contact: Codable {
    
    public var name: String?
    public var phone: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case phone = "phone"
    }
    
}

extension Contact {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        phone = try container.decodeIfPresent(String.self, forKey: .phone)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(phone, forKey: .phone)
    }
}
