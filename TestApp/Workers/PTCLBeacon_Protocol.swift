//
//  PTCLBeacon_Protocol.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSProtocols
//
//  Created by Darren Ehlers on 2019/08/12.
//  Copyright © 2019 - 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

import DNSProtocols
import Foundation

// (error: Error?)
//public typealias PTCLCacheBlockVoidError = (Error?) -> Void
// (object: Any?, error: Error?)
//public typealias PTCLCacheBlockVoidAnyError = (Any?, Error?) -> Void

public protocol PTCLBeacon_Protocol: PTCLBase_Protocol
{
    var nextWorker: PTCLBeacon_Protocol? { get }

    init()
    init(nextWorker: PTCLBeacon_Protocol)

    // MARK: - Business Logic / Single Item CRUD
}
