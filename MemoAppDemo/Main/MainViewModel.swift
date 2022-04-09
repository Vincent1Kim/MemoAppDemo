//
//  MainViewModel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/08.
//

import RealmSwift

protocol MainViewModelProtocol {
    var memoLength : Observable<Int>{ get set }
    var memo: Observable<Results<MemoModel>?>{get set}
}

class MainViewModel : MainViewModelProtocol {
    private let realm = try! Realm()
    var memoLength: Observable<Int> = Observable(0)
    var memo: Observable<Results<MemoModel>?> = Observable(nil)
    
    
    func getMemoListLength() {
        let memoSize = realm.objects(MemoModel.self).count
        memoLength.value = memoSize
    }
    
    func getMemo() {
        print(realm.objects(MemoModel.self))
        memo.value = realm.objects(MemoModel.self)
    }
    func delMemo(index : Int) {
        let memoData = realm.objects(MemoModel.self)
        try! realm.write{
            realm.delete(memoData[index])
        }
    }
}
