//
//  BluetoothUI.swift
//  Interview
//
//  Created by JIDTP1408 on 07/05/25.
//

import Foundation
import CoreBluetooth

class BluetoothCentralManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    private var centralManager: CBCentralManager!
    @Published var discoveredPeripherals: [CBPeripheral] = []
    @Published var connectedPeripheral: CBPeripheral?
    @Published var connectionStatus: String = "Not Connected"
    
    private var seenPeripheralIDs: Set<UUID> = []

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            startScanning()
        }
    }

    func startScanning() {
        discoveredPeripherals = []
        seenPeripheralIDs = []
        connectionStatus = "Scanning..."
        
        centralManager.scanForPeripherals(withServices: nil, options: [
            CBCentralManagerScanOptionAllowDuplicatesKey: false
        ])
    }

    func centralManager(_ central: CBCentralManager,
                        didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any],
                        rssi RSSI: NSNumber) {
        guard !seenPeripheralIDs.contains(peripheral.identifier) else { return }

        seenPeripheralIDs.insert(peripheral.identifier)
        discoveredPeripherals.append(peripheral)
    }

    // 🧩 Connect to a selected peripheral
    func connect(to peripheral: CBPeripheral) {
        centralManager.stopScan()
        peripheral.delegate = self
        centralManager.connect(peripheral, options: nil)
        connectionStatus = "Connecting to \(peripheral.name ?? "Device")..."
    }

    // ✅ Called when connection is successful
    func centralManager(_ central: CBCentralManager,
                        didConnect peripheral: CBPeripheral) {
        connectedPeripheral = peripheral
        connectionStatus = "Connected to \(peripheral.name ?? "Device")"
    }

    // ❌ Called if connection fails
    func centralManager(_ central: CBCentralManager,
                        didFailToConnect peripheral: CBPeripheral, error: Error?) {
        connectionStatus = "Failed to connect: \(error?.localizedDescription ?? "Unknown error")"
    }
}
