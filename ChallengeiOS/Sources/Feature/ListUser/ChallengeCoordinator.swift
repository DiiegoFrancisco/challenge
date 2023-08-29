//
//  ChallengeCoordinator.swift
//  ChallengeiOS
//
//  Created by Diego Francisco do Santos on 28/08/23.
//

import Foundation
import UIKit
class ChallengeCoordinator: Coordinator {
    public var children = [Coordinator]()
    public var navigationController: UINavigationController
    weak public var parent: Coordinator?
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = ChallengeListUserViewModel(coordinator: self)
        let vc = ChallengeListUserViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func routeToContractDetails(user: String) {
        let vm = ChallengeDetailsUserViewModel()
        let vc = ChallengeDetailsUserViewController(viewModel: vm)
        vc.user = user
        navigationController.pushViewController(vc, animated: true)
    }
}
