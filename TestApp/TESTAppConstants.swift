//
//  TESTAppConstants.swift
//  TestApp
//
//  Created by Darren Ehlers on 12/2/19.
//  Copyright © 2019 DoubleNode.com, LLC. All rights reserved.
//

import DNSCore
import UIKit

class TESTAppConstants: DNSAppConstants {
    static var beaconstacDevKey: String {
        do {
            return try self.constant(from: "beaconstacDevKey") as String
        } catch { return "" }
    }
}
