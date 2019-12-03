//
//  TESTFirstInteractor.swift
//  DoubleNode Core - DNSBaseStage Prototype App
//
//  Created by Darren Ehlers on 2019/08/12.
//  Copyright © 2019 - 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSProtocols

public protocol TESTFirstBusinessLogic: DNSBaseStageBusinessLogic {
    // MARK: - Outgoing Pipelines
    var initiallyPublisher: PassthroughSubject<TESTFirstModels.Initially.Response, Never> { get }
}

open class TESTFirstInteractor: DNSBaseStageInteractor, TESTFirstBusinessLogic {
    public var initializationObject: TESTFirstModels.Initialization {
        return baseInitializationObject as! TESTFirstModels.Initialization
    }

    // MARK: - Outgoing Pipelines
    public let initiallyPublisher = PassthroughSubject<TESTFirstModels.Initially.Response, Never>()

    // MARK: - Incoming Pipelines
    var initiallySubscriber: AnyCancellable?

    override open func subscribe(to baseViewController: DNSBaseStageDisplayLogic) {
        super.subscribe(to: baseViewController)

        let viewController: TESTFirstDisplayLogic = baseViewController as! TESTFirstDisplayLogic

        initiallySubscriber = viewController.selectTestPublisher
            .sink { request in self.doSelectTest(request) }
    }

    override open func stageWillAppear(_ request: DNSBaseStageBaseRequest) {
        super.stageWillAppear(request)

        initiallyPublisher.send(TESTFirstModels.Initially.Response(embeddedInNavBar: initializationObject.embeddedInNavBar))
    }

    public func doSelectTest(_ request: TESTFirstModels.Base.Request) {
        do { try self.analyticsWorker?.doTrack(event: "\(#function)") } catch { }

        self.endStage(with: TESTFirstStage.Intents.test,
                      and: false,
                      and: TESTFirstModels.Base.Results())
    }
}
