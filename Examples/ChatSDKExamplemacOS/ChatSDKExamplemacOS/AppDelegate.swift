//
//  AppDelegate.swift
//  ChatSDKExamplemacOS
//
//  Created by Mihaela MJ on 09.12.2024..
//

import Cocoa
import AppKit
import ChatSDK

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the main view controller
        let mainViewController = makeMainViewController()

        // Create the window
        window = NSWindow(
            contentRect: NSMakeRect(0, 0, 800, 600), // Initial size of the window
            styleMask: [.titled, .closable, .resizable, .miniaturizable],
            backing: .buffered,
            defer: false
        )
        
        window?.title = "My App"
        window?.contentViewController = mainViewController
        window?.makeKeyAndOrderFront(nil) // Show the window
    }

}

// MARK: Choose Airport -

private extension AppDelegate {

    func makeMainViewController() -> NSViewController {
        let viewController = NSViewController()
        viewController.view = NSView(frame: NSRect(x: 0, y: 0, width: 800, height: 600)) // Set a frame
        viewController.view.wantsLayer = true
        viewController.view.layer?.backgroundColor = NSColor.white.cgColor

        let resChatButton = NSButton(title: "Open ResChat", target: self, action: #selector(openResChat))
        resChatButton.bezelStyle = .rounded

        // Customize the button appearance
        resChatButton.wantsLayer = true
        resChatButton.layer?.backgroundColor = NSColor.systemBlue.cgColor // Button background color
        resChatButton.layer?.cornerRadius = 5 // Rounded corners
        resChatButton.contentTintColor = .white // Button text color

        viewController.view.addSubview(resChatButton)
        resChatButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resChatButton.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            resChatButton.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor),
            resChatButton.widthAnchor.constraint(equalToConstant: 120), // Optional: Button width
            resChatButton.heightAnchor.constraint(equalToConstant: 40) // Optional: Button height
        ])
        
        return viewController
    }
    
    @objc func openResChat(_ sender: NSButton) {
        guard let window = NSApp.mainWindow,
              let rootViewController = window.contentViewController else { return }
        ChatManager.shared.presentResChatInterface(from: rootViewController)
    }
}
