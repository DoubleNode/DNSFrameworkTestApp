//
//  TESTSecondPresenter.swift
//  DoubleNode Core - DNSBaseStage Prototype App
//
//  Created by Darren Ehlers on 2019/08/12.
//  Copyright © 2019 - 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSProtocols

public protocol TESTSecondPresentationLogic: DNSBaseStagePresentationLogic {
    // MARK: - Outgoing Pipelines
    var initiallyPublisher: PassthroughSubject<TESTSecondModels.Initially.ViewModel, Never> { get }
}

open class TESTSecondPresenter: DNSBaseStagePresenter, TESTSecondPresentationLogic {
    // MARK: - Outgoing Pipelines
    public let initiallyPublisher = PassthroughSubject<TESTSecondModels.Initially.ViewModel, Never>()

    // MARK: - Incoming Pipelines
    var initiallySubscriber: AnyCancellable?

    override open func subscribe(to baseInteractor: DNSBaseStageBusinessLogic) {
        super.subscribe(to: baseInteractor)

        let interactor: TESTSecondBusinessLogic = baseInteractor as! TESTSecondBusinessLogic

        initiallySubscriber = interactor.initiallyPublisher
            .sink { response in self.presentInitially(response) }
    }

    public func presentInitially(_ response: TESTSecondModels.Initially.Response) {
        do { try self.analyticsWorker?.doTrack(event: "\(#function)") } catch { }

        initiallyPublisher.send(TESTSecondModels.Initially.ViewModel(hideTestButton: !response.embeddedInNavBar))
    }
}
