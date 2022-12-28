//
//  File.swift
//  
//
//  Created by Ilya Bondarenko on 04.12.2022.
//

import Foundation
import UIKit

open class BaseScenario: Scenario {
    
    public private(set) weak var rootViewController: UIViewController?
    
    // MARK: - Init Method
    
    public init(delegate: ScenarioDelegate? = nil, rootViewController: UIViewController?) {
        self.rootViewController = rootViewController
        super.init(delegate: delegate)
    }
}
