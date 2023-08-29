//
//  ChallengeListUserViewController.swift
//  ChallengeiOS
//
//  Created by Diego Francisco do Santos on 26/08/23.
//

import UIKit
import Foundation
import RxSwift

class ChallengeListUserViewController: UIViewController {
    var customView: ChallengeListUserView? = nil
    let disposeBag = DisposeBag()
    let viewModel: ChallengeListUserViewModel

    init(viewModel: ChallengeListUserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        setupUI()
    }
    
    private func buildView() {
        view = ChallengeListUserView()
        customView = view as? ChallengeListUserView
    }
    private func setupUI() {
        self.title = "Lista de usuários"
        customView?.tableView.dataSource = self
        customView?.tableView.delegate = self
        setupBind()
    }
    
    private func setupBind() {
        startLoading()
        viewModel.getUsers()
        
        viewModel.reloadData
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.customView?.tableView.reloadData()
            }).disposed(by: disposeBag)
        
        viewModel.errorMessage
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] errorMessage in
                guard let self = self else { return }
                view.showToast(message: errorMessage ?? "")
            }).disposed(by: disposeBag)
    }
}

extension ChallengeListUserViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.customView?.tableView.dequeueReusableCell(withIdentifier: ChallengeListUserCell.identifier, for: indexPath)  as? ChallengeListUserCell
        cell?.accessoryType = .disclosureIndicator
        if let user = self.viewModel.userData?[indexPath.row] {
            cell?.userName.text = user.login.prefix(1).capitalized + user.login.dropFirst()
            DispatchQueue.main.async {
                if let imageURL = URL(string: user.avatar_url),
                   let imageData = try? Data(contentsOf: imageURL),
                   let image = UIImage(data: imageData) {
                    self.stopLoading()
                    cell?.avatarUserImage.image = image
                    cell?.avatarUserImage.layer.cornerRadius = (cell?.avatarUserImage.frame.size.width ?? 0) / 2
                    cell?.avatarUserImage.layer.borderWidth = 2
                    cell?.avatarUserImage.layer.borderColor = UIColor.lightGray.cgColor
                    
                }
            }
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let user = viewModel.userData?[indexPath.row].login {
            //            viewModel.didRouteContractDetails(user: user)
            let vm = ChallengeDetailsUserViewModel()
            let vc = ChallengeDetailsUserViewController(viewModel: vm)
            vc.user = user
            //            vc.hidesBottomBarWhenPushed = true
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
