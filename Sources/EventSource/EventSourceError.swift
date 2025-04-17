//
//  EventSourceError.swift
//  EventSource
//
//  Copyright © 2023 Firdavs Khaydarov (Recouse). All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum EventSourceError: LocalizedError {
    
    case connectionError(statusCode: Int, response: Data)
    case undefinedConnectionError
    /// The ``EventSource/EventSource/DataTask`` event stream is already being consumed by another task.
    /// A stream can only be consumed by one task at a time.
    case alreadyConsumed

    public var errorDescription: String? {
        switch self {
            case .undefinedConnectionError:
                return "Undefined connection error"
            case .connectionError(let statusCode, let response):
                return "The connection to the server failed with status code: \(statusCode). Response: \(String(data: response, encoding: .utf8) ?? "No response data")"
            case .alreadyConsumed:
                return "The `DataTask` events stream is already being consumed by another task."
        }
    }
}
