//
//  File.swift
//  
//
//  Created by Ilya Bondarenko on 04.12.2022.
//

import Foundation
import UIKit

open class InitialScenario: Scenario {
    
    public private(set) var window: UIWindow
    
    // MARK: - Init Method
    
    public init(delegate: ScenarioDelegate? = nil, window: UIWindow) {
        self.window = window
        super.init(delegate: delegate)
    }
    
    // MARK: - Setup Root View Controller
    
    public func setup(rootViewController: UIViewController) {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
