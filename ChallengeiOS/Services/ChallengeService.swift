//
//  ChallengeService.swift
//  ChallengeiOS
//
//  Created by Diego Francisco do Santos on 26/08/23.
//

import Foundation

public class ChallengeService {
    private var baseURL = "https://api.github.com"
    
    public init() {}
    
    func getUser(completion: @escaping (Swift.Result<[UserData], Error>) -> Void) {
        guard let path = URL(string: baseURL + "/users") else { return }
        let task = URLSession.shared.dataTask(with: path) {[weak self] data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let data = try JSONDecoder().decode([UserData].self, from: data)
                    completion(.success(data))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
            task.resume()
    }
    
    func getDetailsUser(user: String, completion: @escaping (Swift.Result<DetailsUserData, Error>) -> Void) {
        guard let path = URL(string: baseURL + "/users/\(user)") else { return }
        let task = URLSession.shared.dataTask(with: path) {[weak self] data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let data = try JSONDecoder().decode(DetailsUserData.self, from: data)
                    completion(.success(data))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
            task.resume()
    }
    
    func getRepositorysUser(user: String, completion: @escaping (Swift.Result<[RepositoryData], Error>) -> Void) {
        guard let path = URL(string: baseURL + "/users/\(user)/repos") else { return }
        let task = URLSession.shared.dataTask(with: path) {[weak self] data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let data = try JSONDecoder().decode([RepositoryData].self, from: data)
                    completion(.success(data))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
            task.resume()
    }
}

