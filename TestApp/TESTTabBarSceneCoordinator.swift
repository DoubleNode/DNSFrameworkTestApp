//
//  TESTTabBarSceneCoordinator.swift
//  DoubleNode Core - DNSBaseScene Prototype App
//
//  Created by Darren Ehlers on 10/29/19.
//  Copyright © 2019 DoubleNode.com. All rights reserved.
//

import DNSBaseStage
import DNSCore
import UIKit

open class TESTTabBarSceneCoordinator: DNSTabBarCoordinator, DNSSceneCoordinatorProtocol {
    var windowScene: UIWindowScene
    public var appConfigurator: TESTAppConfigurator {
        return TESTAppConfigurator.shared
    }

    var firstConfigurator: TESTFirstConfigurator {
        let retval = TESTFirstConfigurator(appConfigurator: self.appConfigurator)
        retval.tabBarController = self.tabBarController
        return retval
    }
    var secondConfigurator: TESTSecondConfigurator {
        let retval = TESTSecondConfigurator(appConfigurator: self.appConfigurator)
        retval.tabBarController = self.tabBarController
        return retval
    }

    required public init(with windowScene: UIWindowScene) {
        self.windowScene = windowScene

        // swiftlint:disable:next force_cast
        let windowDelegate: UIWindowSceneDelegate = windowScene.delegate as! UIWindowSceneDelegate
        let window: UIWindow = windowDelegate.window!!
        // swiftlint:disable:next force_cast
        let tabBarController: UITabBarController = window.rootViewController as! UITabBarController

        super.init(with: tabBarController)
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

        // Added initial two Stages to TabBarController
        _ = firstConfigurator.runStage(with: self,
                                       and: DNSBaseStageDisplayType.tabBarAdd,
                                       and: TESTFirstModels.Initialization(embeddedInNavBar: false),
                                       thenRun: { (_, _, _) in

        })

        _ = secondConfigurator.runStage(with: self,
                                        and: DNSBaseStageDisplayType.tabBarAdd,
                                        and: TESTSecondModels.Initialization(embeddedInNavBar: false),
                                        thenRun: { (intent, _, _) in
                                            self.run(actions: [TESTSecondStage.Intents.test: { self.showTestStage() }],
                                                     for: intent)
        })
    }

    func showTestStage() {

    }
}
