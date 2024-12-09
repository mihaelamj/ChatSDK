//
//  AppDelegate.swift
//  ChatSDKExampleiOS
//
//  Created by Mihaela MJ on 09.12.2024..
//

import UIKit
import ChatSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = makeMainController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

// MARK: Choose Airport -

private extension AppDelegate {
    func makeMainController() -> UIViewController {
        let navigationController = UINavigationController()
        let mainVC = makeMainViewController()
        navigationController.viewControllers = [mainVC]
        return navigationController
    }
}


private extension AppDelegate {
    func makeMainViewController() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        
        let resChatButton = UIButton(type: .system)
        resChatButton.setTitle("Open ResChat", for: .normal)
        resChatButton.addTarget(self, action: #selector(openResChat), for: .touchUpInside)
        
        viewController.view.addSubview(resChatButton)
        resChatButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resChatButton.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            resChatButton.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
        ])
        
        return viewController
    }
    
    @objc func openResChat(_ sender: UIButton) {
        guard let rootViewController = window?.rootViewController else { return }
        ChatManager.shared.presentResChatInterface(from: rootViewController)
    }
}
