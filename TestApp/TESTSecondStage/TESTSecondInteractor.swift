//
//  TESTSecondInteractor.swift
//  DoubleNode Core - DNSBaseStage Prototype App
//
//  Created by Darren Ehlers on 2019/08/12.
//  Copyright © 2019 - 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSProtocols

public protocol TESTSecondBusinessLogic: DNSBaseStageBusinessLogic {
    // MARK: - Outgoing Pipelines
    var initiallyPublisher: PassthroughSubject<TESTSecondModels.Initially.Response, Never> { get }
}

open class TESTSecondInteractor: DNSBaseStageInteractor, TESTSecondBusinessLogic {
    public var initializationObject: TESTSecondModels.Initialization {
        return baseInitializationObject as! TESTSecondModels.Initialization
    }

    // MARK: - Outgoing Pipelines
    public let initiallyPublisher = PassthroughSubject<TESTSecondModels.Initially.Response, Never>()

    // MARK: - Incoming Pipelines
    var initiallySubscriber: AnyCancellable?

    override open func subscribe(to baseViewController: DNSBaseStageDisplayLogic) {
        super.subscribe(to: baseViewController)

        let viewController: TESTSecondDisplayLogic = baseViewController as! TESTSecondDisplayLogic

        initiallySubscriber = viewController.selectTestPublisher
            .sink { request in self.doSelectTest(request) }
    }

    override open func stageWillAppear(_ request: DNSBaseStageBaseRequest) {
        super.stageWillAppear(request)

        initiallyPublisher.send(TESTSecondModels.Initially.Response(embeddedInNavBar: initializationObject.embeddedInNavBar))
    }

    public func doSelectTest(_ request: DNSBaseStageModels.Base.Request) {
        do { try self.analyticsWorker?.doTrack(event: "\(#function)") } catch { }

        dismissPublisher.send(DNSBaseStageModels.Dismiss.Response(animated: true))
    }
}
