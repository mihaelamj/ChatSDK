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

import Foundation

#if os(iOS)
//@_exported import ResChatHouUIKit
//@_exported import ResChatUIKit
import UIKit
public typealias PlatformViewController = UIViewController
#elseif os(macOS)
//@_exported import ResChatHouAppKit
//@_exported import ResChatAppKitUI
import AppKit
public typealias PlatformViewController = NSViewController
#endif

public class ChatManager: NSObject {
    
    public static let shared = ChatManager()
}
