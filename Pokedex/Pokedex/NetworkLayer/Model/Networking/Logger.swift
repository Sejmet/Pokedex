//
//  Logger.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation

public struct ApricotError: Error {
    let code: Int
    let message: String
    let stackTrace: String
    var description: String {
           get {
               return "\(code): \(message)"
           }
    }
    var nserror: NSError {
        get {
            let userInfo = [
                NSLocalizedDescriptionKey: description,
                "code": code,
                "message": message,
                "stackTrace": stackTrace,
                "platform": "iOS"
            ] as [String : Any]
            
            return NSError.init(domain: NSCocoaErrorDomain,
                                     code: -1002,
                                     userInfo: userInfo)
        }
    }
}
/// Use this instead of `print` in the app
public struct Logger {
    fileprivate init() {}

    public enum Priority {
        case trace, debug, warn, none
    }

    public static var priority: Priority = .debug

    #if DEBUG
    private static let shortNames = [
        "UIViewController": "📸",
        "FindEntityViewModel": "🔎",
        "KeychainHelper": "🔐",
        "AppContext": "⌚️"
    ]

    private static func log(icon: String, file: String, function: String, message: String) {
        let fileName = file.components(separatedBy: "/").last
        let fileNameWithoutExtension = fileName?.components(separatedBy: ".").first ?? "-"
        let shortName = shortNames[fileNameWithoutExtension] ?? fileNameWithoutExtension

        print("\(icon) \(shortName)#\(function) - \(message)")
    }
    
    public static func error(_ message: String, code: PokedexErrorCode,icon: String = "🔥", from file: String = #file, at function: String = #function) {
        log(icon: icon, file: file, function: function, message: message)
    }

    public static func trace(_ message: String, icon: String = "ℹ️", from file: String = #file, at function: String = #function) {
        guard .trace == priority else { return }

        log(icon: icon, file: file, function: function, message: message)
    }

    public static func debug(_ message: String, icon: String = "➡️", from file: String = #file, at function: String = #function) {
        guard [.debug, .trace].contains(priority) else { return }

        log(icon: icon, file: file, function: function, message: message)
    }

    public static func warn(_ message: String, from file: String = #file, at function: String = #function) {
        guard [.debug, .trace, .warn].contains(priority) else { return }

        log(icon: "⚠️", file: file, function: function, message: message)
    }

    public static func warn(_ message: String, _ error: Error, from file: String = #file, at function: String = #function) {
        guard [.debug, .trace, .warn].contains(priority) else { return }

        log(icon: "⚠️", file: file, function: function, message: "\(message): \(error)")
    }

    public static func warn(_ error: Error, from file: String = #file, at function: String = #function) {
        guard [.debug, .trace, .warn].contains(priority) else { return }

        log(icon: "⚠️", file: file, function: function, message: "\(error)")
    }

    public static func unimplemented(from file: String = #file, at function: String = #function) {
        guard [.debug, .trace, .warn].contains(priority) else { return }

        log(icon: "☢️", file: file, function: function, message: "UNIMPLEMENTED")
    }

    #else
    public static func error(_ message: String, code: ApricotErrorCode, icon: String = "", from file: String = "", at function: String = "") {
        let userInfo = [
            NSLocalizedDescriptionKey: "ApricotError",
            "message": message,
            "platform": "iOS"
        ] as [String : Any]
        
        let e = NSError.init(domain: NSCocoaErrorDomain,
                             code: code.rawValue,
                                 userInfo: userInfo)
        Crashlytics.crashlytics().record(error: e)
    }
    
    public static func trace(_ message: String, icon: String = "", from file: String = "", at function: String = "") {
    }

    public static func debug(_ message: String, icon: String = "", from file: String = "", at function: String = "") {
    }

    public static func warn(_ message: String, from file: String = "", at function: String = "") {
    }

    public static func warn(_ message: String, _ error: Error, from file: String = #file, at function: String = #function) {
    }

    public static func warn(_ error: Error, from file: String = "", at function: String = "") {
    }

    public static func unimplemented(from file: String = #file, at function: String = #function) {
    }
    #endif
}

