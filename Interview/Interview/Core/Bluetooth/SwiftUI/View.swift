//
//  View.swift
//  Interview
//
//  Created by JIDTP1408 on 07/05/25.
//

import Foundation
import SwiftUI

import SwiftUI

struct PeripheralListView: View {
    @StateObject private var bluetoothManager = BluetoothCentralManager()

    var body: some View {
        NavigationView {
            VStack {
                List(bluetoothManager.discoveredPeripherals, id: \.identifier) { peripheral in
                    Button(action: {
                        bluetoothManager.connect(to: peripheral)
                    }) {
                        VStack(alignment: .leading) {
                            Text(peripheral.name ?? "Unnamed")
                                .font(.headline)
                            Text(peripheral.identifier.uuidString)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }

                Text(bluetoothManager.connectionStatus)
                    .foregroundColor(.blue)
                    .padding(.top, 10)
            }
            .navigationTitle("Nearby Devices")
        }
    }
}
