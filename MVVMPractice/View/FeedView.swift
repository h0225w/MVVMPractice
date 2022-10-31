//
//  FeedView.swift
//  MVVMPractice
//
//  Created by 박현우 on 2022/10/26.
//

import UIKit
import Then
import SnapKit

class FeedView: UIView {
    let stackView = UIStackView().then {
        $0.spacing = 20
        $0.alignment = .fill
        $0.distribution = .fill
        $0.axis = .vertical
    }
    
    // 타이틀
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
    }
    
    // 내용
    let contentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    // 작성자
    let authorLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.textColor = .gray
    }
    
    // 등록일
    let regDateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.textColor = .gray
    }
    
    // 새로운 데이터 추가 버튼
    let appendButton = UIButton().then {
        $0.setTitle("추가", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        [titleLabel, contentLabel, authorLabel, regDateLabel, appendButton].forEach {
            stackView.addArrangedSubview($0)
            
//            $0.snp.makeConstraints {
//                $0.horizontalEdges.equalToSuperview().offset(15)
//            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
