//
//  WriteViewmodel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/08.
//
import RealmSwift
import SwiftUI
protocol WriteViewModelProtocol {
    var memo: Observable<Results<MemoModel>?>{get set}
}
final class WriteViewModel : WriteViewModelProtocol {
    var memo: Observable<Results<MemoModel>?> = Observable(nil)
    
    
    private let realm = try! Realm()
    
    func saveMemo(title: String, content: String) {
        let initMemo = MemoModel()
        var idx = 0
        if let lastAlert = realm.objects(MemoModel.self).last {
            idx = lastAlert.idx + 1
        }
        initMemo.title = title
        initMemo.content = title
        initMemo.idx = idx
        try! realm.write {
            realm.add(initMemo)
        }
    }
    
    func getMemo(idx : Int) {
        let memoList = realm.objects(MemoModel.self).filter("idx = \(idx)")
        memo.value = memoList
    }
    func updateMemo(idx : Int, title: String, content: String) {
        if let firstPerson = realm.objects(MemoModel.self).filter("idx = \(idx)").first {
            
            try? realm.write {
                firstPerson.title = title
                firstPerson.content = content
            }
            
        }
    }
}
