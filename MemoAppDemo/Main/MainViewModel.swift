//
//  MainViewModel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/08.
//

import RealmSwift

protocol MainViewModelProtocol {
    var memoLength : Observable<Int>{ get set }
    var memoTitle: Observable<List<Memo>>{get set}
}

class MainViewModel : MainViewModelProtocol {

    var memoLength: Observable<Int> = Observable(0)
    var memoTitle: Observable<List<Memo>> = Observable(List<Memo>())
    private let realm = try! Realm()
    
    func getMemoListLength() {
        let memoSize = realm.objects(MemoModel.self)
        memoLength.value = memoSize.count
    }
    
    func getMemoData() {
        let memo = realm.objects(MemoModel.self)
        print(memo)
        for i in 0..<memo.count {
            memoTitle.value = memo[0].memo
        }
    }
}
