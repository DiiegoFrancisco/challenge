//
//  ChallengeDetailsView.swift
//  ChallengeiOS
//
//  Created by Diego Francisco do Santos on 29/08/23.
//

import UIKit
class ChallengeDetailsView: UIView {
    var userName: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var nickName: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    var avatarUserImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var company: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var location: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var repositorys: UILabel = {
        var label = UILabel()
        label.text = "Respositórios"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var lineView: UIView = {
        var line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    var tableView: UITableView = {
        var view = UITableView()
        view.backgroundColor = .white
        view.separatorStyle = .none
        view.rowHeight = UITableView.automaticDimension
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(ChallengeRepositorysListCell.self, forCellReuseIdentifier: ChallengeRepositorysListCell.identifier)
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        addSubview(userName)
        addSubview(nickName)
        addSubview(avatarUserImage)
        addSubview(location)
        addSubview(company)
        addSubview(repositorys)
        addSubview(lineView)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarUserImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarUserImage.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarUserImage.widthAnchor.constraint(equalToConstant: 70.0),
            avatarUserImage.heightAnchor.constraint(equalToConstant: 70.0)
            
        ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: avatarUserImage.bottomAnchor, constant: 16),
            userName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            nickName.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 4),
            nickName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nickName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            company.topAnchor.constraint(equalTo: nickName.bottomAnchor, constant: 16),
            company.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            company.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: company.bottomAnchor, constant: 4),
            location.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            location.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            repositorys.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 24),
            repositorys.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            repositorys.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: repositorys.bottomAnchor, constant: 12),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            lineView.heightAnchor.constraint(equalToConstant: 0.5)
        ])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
