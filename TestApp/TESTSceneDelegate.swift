//
//  TESTSceneDelegate.swift
//  DoubleNode Core - DNSBaseScene Prototype App
//
//  Created by Darren Ehlers on 10/29/19.
//  Copyright © 2019 DoubleNode.com. All rights reserved.
//

import DNSBaseStage
import DNSCore
import UIKit

class TESTSceneDelegate: DNSSceneDelegate {
    override func scene(_ scene: UIScene,
                        willConnectTo session: UISceneSession,
                        options connectionOptions: UIScene.ConnectionOptions) {
        let windowScene: UIWindowScene? = scene as? UIWindowScene
        guard windowScene != nil else { return }

        let windowDelegate: UIWindowSceneDelegate? = windowScene!.delegate as? UIWindowSceneDelegate
        guard windowDelegate != nil else { return }

        let window: UIWindow? = windowDelegate!.window as? UIWindow
        guard window != nil else { return }

        coordinator = TESTNavBarSceneCoordinator(with: windowScene!)
        //coordinator = TESTTabBarSceneCoordinator(with: windowScene!)

        super.scene(scene, willConnectTo: session, options: connectionOptions)
    }
}
