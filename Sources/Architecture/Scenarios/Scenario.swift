//
//  Scenario.swift
//  
//
//  Created by Ilya Bondarenko on 30.11.2022.
//

import Foundation
import UIKit

public protocol ScenarioDelegate: AnyObject {
    
    func didFinish(scenario: Scenario)
    
    func didComplete(scenario: Scenario)
    
    func didCancel(scenario: Scenario)
}

public extension ScenarioDelegate {
    
    func didComplete(scenario: Scenario) {
        print("Did complete scenario: \(scenario)")
    }
    
    func didCancel(scenario: Scenario) {
        print("Did cancel scenario: \(scenario)")
    }
}

public class Scenario: Hashable {
    
    private var identifier: String
    
    public weak var delegate: ScenarioDelegate?
    
    public private(set) var childScenarios: [Scenario] = []
    
    // MARK: - Init Method
    
    public init(delegate: ScenarioDelegate? = nil) {
        self.identifier = UUID().uuidString
        self.delegate = delegate
    }
    
    // MARK: - Start/Stop
    
    // This method performs the necessary actions to run the scenario.
    // Can be overridden in a subclass to add additional actions.
    public func start() {
        // By default this method is empty.
        // It can be overridden in a subclass to add additional actions.
        // For example: Present/Push view controllers, Setup needed managers.
    }
    
    // This method performs the necessary actions to stop the script.
    // Can be overridden in a subclass to add additional actions.
    public func stop() {
        
    }
    
    // MARK: - Finish
    
    public func finish() {
        delegate?.didFinish(scenario: self)
    }
    
    public func finishAllChildScenarios() {
        for scenario in childScenarios {
            scenario.didFinish(scenario: scenario)
        }
    }
    
    // MARK: - Hashable
    
    public static func == (lhs: Scenario, rhs: Scenario) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

extension Scenario: ScenarioDelegate {
    
    public func didFinish(scenario: Scenario) {
        scenario.stop()
        childScenarios.removeAll(where: { $0 == scenario })
    }
}
