//
//  ChallengeDetailsUserViewController.swift
//  ChallengeiOS
//
//  Created by Diego Francisco do Santos on 28/08/23.
//

import UIKit
import RxSwift
class ChallengeDetailsUserViewController: UIViewController {
    var customView: ChallengeDetailsView? = nil
    var user = ""
    let disposeBag = DisposeBag()
    let viewModel: ChallengeDetailsUserViewModel
    
    init(viewModel: ChallengeDetailsUserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        setupBind()
    }
    
    private func buildView() {
        view = ChallengeDetailsView()
        customView = view as? ChallengeDetailsView
        
    }
    
    private func setupUI() {
        title = "Detalhes do usuário"
        view.backgroundColor = .white
        customView?.tableView.dataSource = self
        customView?.tableView.delegate = self
        customView?.userName.text = viewModel.details?.name
        customView?.nickName.text = viewModel.details?.login
        customView?.company.text = viewModel.details?.company
        customView?.location.text = viewModel.details?.location
        
        if let imageURL = URL(string: viewModel.details?.avatar_url ?? ""),
           let imageData = try? Data(contentsOf: imageURL),
           let image = UIImage(data: imageData) {
            customView?.avatarUserImage.image = image
            customView?.avatarUserImage.layer.cornerRadius = (customView?.avatarUserImage.frame.size.width ?? 0 ) / 2
            customView?.avatarUserImage.layer.borderWidth = 2
            customView?.avatarUserImage.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    private func setupBind() {
        startLoading()
        viewModel.getDetailsUsers(user: self.user)
        viewModel.getRepository(user: self.user)
        viewModel.data
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                setupUI()
            }).disposed(by: disposeBag)
        
        viewModel.reload
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                customView?.tableView.reloadData()
            }).disposed(by: disposeBag)
        
        viewModel.errorMessage
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] errorMessage in
                guard let self = self else { return }
                view.showToast(message: errorMessage ?? "")
            }).disposed(by: disposeBag)
    }
}

extension ChallengeDetailsUserViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repository?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.customView?.tableView.dequeueReusableCell(withIdentifier: ChallengeRepositorysListCell.identifier, for: indexPath)  as? ChallengeRepositorysListCell

        if let data = viewModel.repository?[indexPath.row] {
            cell?.nameRepo.text = data.name
            cell?.urlRepo.text = data.html_url
        }
        
        return cell ?? UITableViewCell()
    }
}
