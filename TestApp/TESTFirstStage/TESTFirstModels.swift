//
//  TESTFirstModels.swift
//  DoubleNode Core - DNSBaseStage Prototype App
//
//  Created by Darren Ehlers on 2019/08/12.
//  Copyright © 2019 - 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

import DNSBaseStage

open class TESTFirstModels: DNSBaseStageModels {
    public struct Initialization: DNSBaseStageBaseInitialization {
        var embeddedInNavBar: Bool
    }
    public enum Initially {
        public struct Response: DNSBaseStageBaseResponse {
            var embeddedInNavBar: Bool
        }
        public struct ViewModel: DNSBaseStageBaseViewModel {
            var hideTestButton: Bool
        }
    }
}

