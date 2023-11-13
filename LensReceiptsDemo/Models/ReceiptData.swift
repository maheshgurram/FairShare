//
//  ReceiptData.swift
//  LensReceiptsDemo
//
//  Created by Mahesh on 11/9/23.
//

import Foundation

public struct ReceiptData: Codable {
    
    public var data: LineItems?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
}

extension ReceiptData {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent(LineItems.self, forKey: .data)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(data, forKey: .data)
    }
}


public struct LineItems: Codable {
    
    public var items: [RowItem]?
    public var tax: Double?
    public var tip: Double?
    public var total: Double?
    public var vendor: Vendor?
    
    enum CodingKeys: String, CodingKey {
        case items = "line_items"
        case tax = "tax"
        case tip = "tip"
        case total = "total"
        case vendor = "vendor"
    }
    
}

extension LineItems {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decodeIfPresent([RowItem].self, forKey: .items)
        tax = try container.decodeIfPresent(Double.self, forKey: .tax)
        tip = try container.decodeIfPresent(Double.self, forKey: .tip)
        total = try container.decodeIfPresent(Double.self, forKey: .total)
        vendor = try container.decodeIfPresent(Vendor.self, forKey: .vendor)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(items, forKey: .items)
        try container.encodeIfPresent(tax, forKey: .tax)
        try container.encodeIfPresent(tip, forKey: .tip)
        try container.encodeIfPresent(total, forKey: .total)
        try container.encodeIfPresent(vendor, forKey: .vendor)
    }
}

public struct Vendor: Codable {
    
    public let rawName: String?
    public let rawAddress: String?
    
    enum CodingKeys: String, CodingKey {
        case rawName = "raw_name"
        case rawAddress = "raw_address"
    }
    
}

extension Vendor {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rawName = try container.decodeIfPresent(String.self, forKey: .rawName)
        rawAddress = try container.decodeIfPresent(String.self, forKey: .rawAddress)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(rawName, forKey: .rawName)
        try container.encodeIfPresent(rawAddress, forKey: .rawAddress)
    }
}
