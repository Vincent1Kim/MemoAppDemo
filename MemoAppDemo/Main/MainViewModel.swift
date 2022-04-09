//
//  MainViewModel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/08.
//

import RealmSwift

protocol MainViewModelProtocol {
    var memoLength : Observable<Int>{ get set }
    var memoTitle: Observable<Results<MemoModel>?>{get set}
}

class MainViewModel : MainViewModelProtocol {

    var memoLength: Observable<Int> = Observable(0)
    var memoTitle: Observable<Results<MemoModel>?> = Observable(nil)
    private let realm = try! Realm()
    
    func getMemoListLength() {
        let memoSize = realm.objects(MemoModel.self)
        memoLength.value = memoSize.count
    }
    
    func getMemoData() {
        //let memo = realm.objects(MemoModel.self)
        //print(memo)
        memoTitle.value = realm.objects(MemoModel.self)
        
    }
}
