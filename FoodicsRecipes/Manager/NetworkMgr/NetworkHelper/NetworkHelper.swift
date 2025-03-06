//
//  NetworkHelper.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation
import Network

@Observable
class NetworkHelper {
    static let shared = NetworkHelper()
    private let monitor: NWPathMonitor
    public private(set) var networkStatus: NWPath.Status = .requiresConnection
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    init() {
        monitor = NWPathMonitor()
    }
    
    func startMonitoring() {
        
        monitor.start(queue: queue)
        
        monitor.pathUpdateHandler = { path in
            self.networkStatus = path.status
        }
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
