//
//  DemoRCApp.swift
//  DemoRC
//
//  Created by Pavel Vaitsikhouski on 23.03.24.
//

import SwiftUI
import RevenueCat

@main
struct DemoRCApp: App {
    
    init() {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "{{TOKEN}}")
    }
    
    var body: some Scene {
        WindowGroup {
            DemoLearnView()
        }
    }
}
