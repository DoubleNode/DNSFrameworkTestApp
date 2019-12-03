//
//  TESTNavBarSceneCoordinator.swift
//  DoubleNode Core - DNSBaseScene Prototype App
//
//  Created by Darren Ehlers on 10/29/19.
//  Copyright © 2019 DoubleNode.com. All rights reserved.
//

import DNSBaseStage
import DNSCore
import UIKit

open class TESTNavBarSceneCoordinator: DNSNavBarCoordinator, DNSSceneCoordinatorProtocol {
    var windowScene: UIWindowScene
    public var appConfigurator: TESTAppConfigurator {
        return TESTAppConfigurator.shared
    }

    var firstConfigurator: TESTFirstConfigurator {
        let retval = TESTFirstConfigurator(appConfigurator: self.appConfigurator)
        retval.navigationController = self.navigationController
        return retval
    }
    var secondConfigurator: TESTSecondConfigurator {
        let retval = TESTSecondConfigurator(appConfigurator: self.appConfigurator)
        retval.navigationController = self.navigationController
        return retval
    }

    required public init(with windowScene: UIWindowScene) {
        self.windowScene = windowScene

        // swiftlint:disable:next force_cast
        let windowDelegate: UIWindowSceneDelegate = windowScene.delegate as! UIWindowSceneDelegate
        let window: UIWindow = windowDelegate.window!!
        // swiftlint:disable:next force_cast
        let navigationController: UINavigationController = window.rootViewController as! UINavigationController

        super.init(with: navigationController)
    }

    // MARK: - Scene lifecycle

    public func didBecomeActive() {
    }

    public func willResignActive() {
    }

    public func willEnterForeground() {
    }

    public func didEnterBackground() {
    }

    // MARK: - Coordinator lifecycle

    override public func start() {
        super.start()

        // Added initial two Stages to NavBarController
        _ = firstConfigurator.runStage(with: self,
                                       and: DNSBaseStageDisplayType.navBarRoot,
                                       and: TESTFirstModels.Initialization(embeddedInNavBar: true),
                                       thenRun: { (intent, _, _) in
                                            self.run(actions: [TESTFirstStage.Intents.test: { self.showSecondStage() }],
                                                     for: intent)
        })
    }

    func showSecondStage() {
        _ = secondConfigurator.runStage(with: self,
                                        and: DNSBaseStageDisplayType.navBarPush,
                                        and: TESTSecondModels.Initialization(embeddedInNavBar: true),
                                        thenRun: { (_, _, _) in
        })
    }
}
