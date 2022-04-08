//
//  WriteViewmodel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/08.
//
import RealmSwift

final class WriteViewModel {
    
    private let realm = try! Realm()
    
    func saveMemo(title: String, content: String) {

        let memo = Memo()
        memo.title = title
        memo.content = content
        try! realm.write {
            realm.add(memo)
        }
    }
}
