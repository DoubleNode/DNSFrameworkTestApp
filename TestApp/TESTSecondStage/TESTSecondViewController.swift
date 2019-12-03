//
//  TESTSecondViewController.swift
//  DoubleNode Core - DNSBaseScene Prototype App
//
//  Created by Darren Ehlers on 10/28/19.
//  Copyright © 2019 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSCoreThreading
import UIKit

public protocol TESTSecondDisplayLogic: DNSBaseStageDisplayLogic {
    // MARK: - Outgoing Pipelines
    var selectTestPublisher: PassthroughSubject<TESTSecondModels.Base.Request, Never> { get }
}

public class TESTSecondViewController: DNSBaseStageViewController, TESTSecondDisplayLogic {
    @IBOutlet var testButton: UIButton?

    // MARK: - Outgoing Pipelines
    public let selectTestPublisher = PassthroughSubject<TESTSecondModels.Base.Request, Never>()

    // MARK: - Incoming Pipelines
    var initiallySubscriber: AnyCancellable?

    override open func subscribe(to basePresenter: DNSBaseStagePresentationLogic) {
        super.subscribe(to: basePresenter)

        let presenter: TESTSecondPresentationLogic = basePresenter as! TESTSecondPresentationLogic

        initiallySubscriber = presenter.initiallyPublisher
            .sink { viewModel in self.displayInitially(viewModel) }
    }

    public func displayInitially(_ viewModel: TESTSecondModels.Initially.ViewModel) {
        do { try self.analyticsWorker?.doTrack(event: "\(#function)") } catch { }

        DNSUIThread.run {
            self.testButton?.isHidden = viewModel.hideTestButton
        }
    }

    @IBAction func testButtonAction(sender: UIButton) {
        do { try self.analyticsWorker?.doTrack(event: "\(#function)") } catch { }

        selectTestPublisher.send(TESTFirstModels.Base.Request())
    }
}
