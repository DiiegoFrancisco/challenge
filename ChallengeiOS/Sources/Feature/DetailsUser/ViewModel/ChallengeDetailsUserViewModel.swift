//
//  ChallengeDetailsUserViewModel.swift
//  ChallengeiOS
//
//  Created by Diego Francisco do Santos on 28/08/23.
//

import Foundation
import RxRelay
class ChallengeDetailsUserViewModel {
    let service = ChallengeService()
    var details: DetailsUserData?
    var repository: [RepositoryData]?
    var data = BehaviorRelay<DetailsUserData?>(value: nil)
    var reload = BehaviorRelay<[RepositoryData]>(value: [])
    var errorMessage = BehaviorRelay<String?>(value: nil)

    func getDetailsUsers(user: String) {
        service.getDetailsUser(user: user) { response in
            switch response {
            case .success(let result):
                self.details = result
                self.data.accept(result)
            case .failure(let error):
                self.errorMessage.accept(error.localizedDescription)
            }
        }
    }
    
    func getRepository(user: String) {
        service.getRepositorysUser(user: user) { response in
            switch response {
            case .success(let result):
                self.repository = result
                self.reload.accept(result)
            case .failure(let error):
                self.errorMessage.accept(error.localizedDescription)
            }
            
        }
    }
    
}
