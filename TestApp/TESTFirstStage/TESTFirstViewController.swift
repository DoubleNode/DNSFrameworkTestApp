//
//  TESTFirstViewController.swift
//  DoubleNode Core - DNSBaseScene Prototype App
//
//  Created by Darren Ehlers on 10/28/19.
//  Copyright © 2019 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSCoreThreading
import UIKit

public protocol TESTFirstDisplayLogic: DNSBaseStageDisplayLogic {
    // MARK: - Outgoing Pipelines
    var selectTestPublisher: PassthroughSubject<TESTFirstModels.Base.Request, Never> { get }
}

public class TESTFirstViewController: DNSBaseStageViewController, TESTFirstDisplayLogic {
    @IBOutlet var testButton: UIButton?

    // MARK: - Outgoing Pipelines
    public let selectTestPublisher = PassthroughSubject<TESTFirstModels.Base.Request, Never>()

    // MARK: - Incoming Pipelines
    var initiallySubscriber: AnyCancellable?

    override open func subscribe(to basePresenter: DNSBaseStagePresentationLogic) {
        super.subscribe(to: basePresenter)

        let presenter: TESTFirstPresentationLogic = basePresenter as! TESTFirstPresentationLogic

        initiallySubscriber = presenter.initiallyPublisher
            .sink { viewModel in self.displayInitially(viewModel) }
    }

    public func displayInitially(_ viewModel: TESTFirstModels.Initially.ViewModel) {
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
