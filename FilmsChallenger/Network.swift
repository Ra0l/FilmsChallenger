//
//  Network.swift
//  FilmsChallenger
//
//  Created by Raul Kevin Aliaga Shapiama on 9/20/24.
//

import Network

class Network {
    static let shared = Network()
    
    private let monitor: NWPathMonitor
    private let queue = DispatchQueue.global(qos: .background)
    var isConnected: Bool = true
    
    private init() {
        monitor = NWPathMonitor()
        monitor.start(queue: queue)
        
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
    }
}
