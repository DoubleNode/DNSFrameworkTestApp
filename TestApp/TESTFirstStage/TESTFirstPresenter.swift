//
//  TESTFirstPresenter.swift
//  DoubleNode Core - DNSBaseStage Prototype App
//
//  Created by Darren Ehlers on 2019/08/12.
//  Copyright © 2019 - 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSProtocols

public protocol TESTFirstPresentationLogic: DNSBaseStagePresentationLogic {
    // MARK: - Outgoing Pipelines
    var initiallyPublisher: PassthroughSubject<TESTFirstModels.Initially.ViewModel, Never> { get }
}

open class TESTFirstPresenter: DNSBaseStagePresenter, TESTFirstPresentationLogic {
    public typealias ConfiguratorType = TESTFirstConfigurator

    // MARK: - Outgoing Pipelines
    public let initiallyPublisher = PassthroughSubject<TESTFirstModels.Initially.ViewModel, Never>()

    // MARK: - Incoming Pipelines
    var initiallySubscriber: AnyCancellable?

    override open func subscribe(to baseInteractor: DNSBaseStageBusinessLogic) {
        super.subscribe(to: baseInteractor)

        let interactor: TESTFirstBusinessLogic = baseInteractor as! TESTFirstBusinessLogic

        initiallySubscriber = interactor.initiallyPublisher
            .sink { response in self.presentInitially(response) }
    }

    public func presentInitially(_ response: TESTFirstModels.Initially.Response) {
        do { try self.analyticsWorker?.doTrack(event: "\(#function)") } catch { }

        initiallyPublisher.send(TESTFirstModels.Initially.ViewModel(hideTestButton: !response.embeddedInNavBar))
    }
}
