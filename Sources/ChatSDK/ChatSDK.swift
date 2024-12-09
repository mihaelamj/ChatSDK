// The Swift Programming Language
// https://docs.swift.org/swift-book


@_exported import ResChatAppearance
@_exported import ResChatMessageManager
@_exported import ResChatAttributedText
@_exported import ResChatHouCommon 
@_exported import ResChatSpeech
@_exported import ResChatProtocols
@_exported import ResChatSocket
@_exported import ResChatProxy
@_exported import ResChatUICommon

import Foundation

#if os(iOS)
@_exported import ResChatHouUIKit
@_exported import ResChatUIKit
import UIKit
public typealias PlatformViewController = UIViewController
#elseif os(macOS)
@_exported import ResChatHouAppKit
@_exported import ResChatAppKitUI
import AppKit
public typealias PlatformViewController = NSViewController
#endif

public class ChatManager: NSObject {
    
    public static let shared = ChatManager()
    
    private var socket: ResChatSocket?
    private weak var presentedViewController: PlatformViewController?
    
    private override init() {
        super.init()
    }
    
    public func presentResChatInterface(from viewController: PlatformViewController) {
        guard presentedViewController == nil else {
            print("ResChat interface is already presented.")
            return
        }
        
        guard let chooserVC = makeChooserController() else {
            print("Failed to create chooser view controller.")
            return
        }
        
    #if os(iOS)
        let navigationController = UINavigationController(rootViewController: chooserVC as! UIViewController)
        navigationController.modalPresentationStyle = .fullScreen
        (viewController as! UIViewController).present(navigationController, animated: true) {
            self.presentedViewController = navigationController
        }
    #elseif os(macOS)
        (viewController as! NSViewController).presentAsModalWindow(chooserVC)
        self.presentedViewController = chooserVC
    #endif
    }

    public func cleanup() {
        stopSocket()
        
    #if os(iOS)
        presentedViewController?.dismiss(animated: true) {
            self.presentedViewController = nil
        }
    #elseif os(macOS)
        presentedViewController?.dismiss(nil)
        self.presentedViewController = nil
    #endif
    }
}


// MARK: Private -

private extension ChatManager {
    
    func makeChooserController() -> PlatformAirportViewController? {
        var airportChooserVC: PlatformViewController?
        airportChooserVC = PlatformViewController.makeChooserController(ofType: AirportChooserViewController.self)
        return airportChooserVC
    }
    
    func startSocket(_ socket: ResChatSocket) {
        self.socket = socket
        socket.connect()
    }
    
    func stopSocket() {
        socket?.disconnect()
        socket = nil
    }
}


// MARK: Public -

extension ChatManager: AirportAndLanguageChooserDelegate {
    public func didSelectAirport(_ airport: Airport,
                                 language: Language,
                                 socket: ResChatSocket,
                                 chatViewController: any PlatformChatViewController,
                                 chooserViewController: PlatformAirportViewController) {
        ResChatSocket.location = nil
        
        print("Airport selected: \(airport.name), Language selected: \(language.rawValue)")
        
        
        guard let uiEventProvidingController = chatViewController as? ResChatProtocols.UIEvent else {
            print("Error: chatViewController is not of type ResChatProtocols.UIEvent")
            return
        }
        
        guard let viewController = uiEventProvidingController as? PlatformViewController else {
            print("Error: chatViewController is not of type \(type(of: PlatformViewController.self))")
            return
        }
        
        guard let airportChooserVC = makeChooserController() else {
            print("Error: makeChooserController() returned nil")
            return
        }
        
        let proxy = SocketProxy(socketProviding: socket,
                                uiProviding: uiEventProvidingController)
        chatViewController.proxy = proxy
        startSocket(socket)
        
#if os(iOS)
        if let airportChooserVC = airportChooserVC as? AirportChooserViewController {
            airportChooserVC.navigationController?.pushViewController(viewController, animated: true)
        }

#elseif os(macOS)
        airportChooserVC.present(viewController, animator: NSViewControllerPresentationAnimator())
#endif
    }
}
