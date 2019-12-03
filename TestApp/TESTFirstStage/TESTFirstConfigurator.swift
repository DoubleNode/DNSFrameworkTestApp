//
//  TESTFirstConfigurator.swift
//  DoubleNode Core - DNSBaseStage Prototype App
//
//  Created by Darren Ehlers on 2019/08/12.
//  Copyright © 2019 - 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

import DNSBaseStage
import DNSBlankWorkers
import DNSCore

open class TESTFirstConfigurator : DNSBaseStageConfigurator {
    public var interactor: TESTFirstInteractor {
        return baseInteractor as! TESTFirstInteractor
    }
    public var presenter: TESTFirstPresenter {
        return basePresenter as! TESTFirstPresenter
    }
    public var viewController: TESTFirstViewController {
        return baseViewController as! TESTFirstViewController
    }

    // MARK: - Public Associated Type Properties
    override public var interactorType: DNSBaseStageInteractor.Type {
        return TESTFirstInteractor.self
    }
    override public var presenterType: DNSBaseStagePresenter.Type {
        return TESTFirstPresenter.self
    }
    override public var viewControllerType: DNSBaseStageViewController.Type {
        return TESTFirstViewController.self
    }

    var appConfigurator: TESTAppConfigurator

    // MARK: - VIP Objects Creation

    required public init(appConfigurator: TESTAppConfigurator) {
        self.appConfigurator = appConfigurator

        super.init()
    }

    override public func configureStage() {
        super.configureStage()

        // Interactor Dependency Injection
        interactor.analyticsWorker = WKRBlankAnalyticsWorker.init()

        // Presenter Dependency Injection
        presenter.analyticsWorker  = WKRBlankAnalyticsWorker.init()

        // ViewController Dependency Injection
        viewController.analyticsWorker = WKRBlankAnalyticsWorker.init()
    }
}
