//
//  BlueTooth.swift
//  Interview
//
//  Created by JIDTP1408 on 07/05/25.
//

import CoreBluetooth

class BluetoothPeripheralManager: NSObject, CBPeripheralManagerDelegate {
    
    var peripheralManager: CBPeripheralManager?
    var transferCharacteristic: CBMutableCharacteristic?
    let serviceUUID = CBUUID(string: "1234")
    let characteristicUUID = CBUUID(string: "ABCD")
    
    override init() {
        super.init()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn:
            print("Bluetooth is ON")
            setupPeripheral()
        default:
            print("Bluetooth not available: \(peripheral.state.rawValue)")
        }
    }
    
    private func setupPeripheral() {
        let characteristic = CBMutableCharacteristic(
            type: characteristicUUID,
            properties: [.read, .notify],
            value: nil,
            permissions: [.readable]
        )
        
        let service = CBMutableService(type: serviceUUID, primary: true)
        service.characteristics = [characteristic]
        
        peripheralManager?.add(service)
        
        let advertisementData: [String: Any] = [
            CBAdvertisementDataServiceUUIDsKey: [serviceUUID],
            CBAdvertisementDataLocalNameKey: "MyPeripheral"
        ]
        peripheralManager?.startAdvertising(advertisementData)
        
        self.transferCharacteristic = characteristic
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        if let error = error {
            print("Failed to add service: \(error.localizedDescription)")
        } else {
            print("Service added successfully")
        }
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error {
            print("Failed to start advertising: \(error.localizedDescription)")
        } else {
            print("Advertising started successfully")
        }
    }
}
