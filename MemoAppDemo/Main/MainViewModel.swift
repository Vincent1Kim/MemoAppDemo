//
//  MainViewModel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/08.
//

import RealmSwift

protocol MainViewModelProtocol {
    var memoLength : Observable<Int>{ get set }
}

class MainViewModel : MainViewModelProtocol {

    var memoLength: Observable<Int> = Observable(0)
    
    private let realm = try! Realm()
    
    func getMemoList() {
        let memoSize = realm.objects(Memo.self)
        memoLength.value = memoSize.count
    }
    
    func getMemoData() {
        
    }
}
