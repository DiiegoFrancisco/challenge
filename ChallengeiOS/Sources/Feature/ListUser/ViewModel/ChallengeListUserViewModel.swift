//
//  ChallengeListUserViewModel.swift
//  ChallengeiOS
//
//  Created by Diego Francisco do Santos on 27/08/23.
//

import Foundation
import RxSwift
import RxRelay

class ChallengeListUserViewModel {
    let service = ChallengeService()
    let coordinator: ChallengeCoordinator
    var userData: [UserData]?
    var reloadData = BehaviorRelay<[UserData]>(value: [])
    var errorMessage = BehaviorRelay<String?>(value: nil)
    
    init(coordinator: ChallengeCoordinator) {
        self.coordinator = coordinator
    }
    
    func getUsers() {
        service.getUser() { response in
            switch response {
            case .success(let result):
                self.userData = result
                self.reloadData.accept(result)
            case .failure(let error):
                self.errorMessage.accept(error.localizedDescription)
            }
        }
    }
    
    func didRouteContractDetails(user: String) {
        self.coordinator.routeToContractDetails(user: user)
    }
}
