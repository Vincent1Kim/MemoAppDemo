//
//  MainViewModel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/08.
//

import RealmSwift

protocol MainViewModelProtocol {
    var memo: Observable<Results<MemoModel>?>{get set}
}

class MainViewModel : MainViewModelProtocol {
    private let realm = try! Realm()
    var memo: Observable<Results<MemoModel>?> = Observable(nil)
    var title: Observable<Int> = Observable(0)
    
    func getMemo() {
        print(realm.objects(MemoModel.self))
        memo.value = realm.objects(MemoModel.self)
    }
    
    func delMemo(index : Int) {
        let memoData = self.realm.objects(MemoModel.self)
        try! self.realm.write{
            self.realm.delete(memoData[index])
        }
        title.value = index
    }
}
