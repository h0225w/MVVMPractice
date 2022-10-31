//
//  FeedViewModel.swift
//  MVVMPractice
//
//  Created by 박현우 on 2022/10/26.
//

import Foundation

class FeedViewModel {
    static let shared = FeedViewModel()
    
    private var feedData: [Feed] = [] {
        didSet {
            self.bindFeedViewModelToController()
        }
    }
    
    var bindFeedViewModelToController: (() -> Void) = {}
    
    // 값 추가
    func insert(_ data: Feed) {
        feedData.append(data)
    }
    
    // 모든 값 읽기
    func getAll() -> [Feed] {
        return feedData
    }
    
    // 특정 인덱스 값 읽기 (없으면 nil)
    func get(_ at: Int) -> Feed? {
        return feedData[at]
    }
    
    // 마지막 인덱스 값 읽기
    func getLast() -> Feed? {
        return feedData.last
    }
    
    // 값 삭제
    func remove(_ at: Int) {
        feedData.remove(at: at)
    }
}
