//
//  ChallengeListUserCell.swift
//  ChallengeiOS
//
//  Created by Diego Francisco do Santos on 26/08/23.
//

import UIKit
class ChallengeListUserCell: UITableViewCell {
    static let identifier = String(describing: ChallengeListUserCell.self)
    
    var userName: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.textColor = .darkGray
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
    
    var lineView: UIView = {
        var line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    override init(style _: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupAddViews()
        setupConstraints()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddViews() {
        addSubview(userName)
        addSubview(avatarUserImage)
        addSubview(lineView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarUserImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarUserImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarUserImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            avatarUserImage.widthAnchor.constraint(equalToConstant: 44.0),
            avatarUserImage.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            userName.leadingAnchor.constraint(equalTo: avatarUserImage.trailingAnchor, constant: 8),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4),
            userName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
        ])
        
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            lineView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    private func setupLayout() {
    }
}
