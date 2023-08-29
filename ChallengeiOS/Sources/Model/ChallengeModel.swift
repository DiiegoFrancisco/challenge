//
//  ChallengeModel.swift
//  ChallengeiOS
//
//  Created by Diego Francisco do Santos on 27/08/23.
//

import UIKit
struct UserData: Codable {
    var login: String
    var avatar_url: String
}

struct DetailsUserData: Codable {
    var login: String?
    var avatar_url: String?
    var name: String?
    var location: String?
    var company: String?
    var public_repos: Int?
}

struct RepositoryData: Codable {
    var name: String?
    var html_url: String?
}
