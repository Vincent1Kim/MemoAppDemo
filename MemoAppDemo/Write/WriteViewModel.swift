//
//  WriteViewmodel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/08.
//
import RealmSwift
import SwiftUI
protocol WriteViewModelProtocol {
    var memo: Observable<MemoModel?>{get set}
}
final class WriteViewModel : WriteViewModelProtocol {
    var memo: Observable<MemoModel?> = Observable(nil)
    
    
    private let realm = try! Realm()
    
    func saveMemo(title: String, content: String) {
        let initMemo = MemoModel()
        initMemo.title = title
        initMemo.content = title
        try! realm.write {
            realm.add(initMemo)
        }
    }
    
    func getMemo(idx : Int) {
        let memoList = realm.objects(MemoModel.self)
        var memo1 : MemoModel? = nil
        for i in 0..<memoList.count {
            if(i == idx){
                memo1 = memoList[i]
            }
        }
        memo.value = memo1
        //print(test2)
    }
    func updateMemo(idx : Int, title: String, content: String) {
        
    }
}
