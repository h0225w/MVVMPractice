//
//  ViewController.swift
//  MVVMPractice
//
//  Created by 박현우 on 2022/10/26.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {
    let feedView = FeedView()
    let viewModel = FeedViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setup()
    }
    
    fileprivate func setup() {
        viewModel.bindFeedViewModelToController = { [weak self] in
            guard let self = self else { return }
            
            let feed = self.viewModel.getLast()
            self.setupView(data: feed)
        }

        view.addSubview(feedView)

        feedView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        feedView.appendButton.addTarget(self, action: #selector(didTapAppendButton), for: .touchUpInside)
        
        viewModel.insert(Feed(title: "안녕하세요.", content: "어쩌구저쩌구", author: "박현우", regDate: "2022-10-26"))
    }

    fileprivate func setupView(data: Feed?) {
        guard let data = data else { return }
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.feedView.titleLabel.text = data.title
            self.feedView.contentLabel.text = data.content
            self.feedView.authorLabel.text = data.author
            self.feedView.regDateLabel.text = data.regDate
        }
    }
    
    @objc fileprivate func didTapAppendButton(sender: UIButton) {
        viewModel.insert(Feed(title: "반갑습니다.", content: "저쩌구어쩌구", author: "홍길동", regDate: "2022-10-27"))
    }
}

