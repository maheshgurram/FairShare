//
//  DeeplinkHandlerProtocol.swift
//  LensReceiptsDemo
//
//  Created by mahender.r.gurram on 23/11/23.
//

import Foundation

protocol DeeplinkHandlerProtocol {
    func canOpenURL(_ url: URL) -> Bool
    func openURL(_ url: URL)
}
