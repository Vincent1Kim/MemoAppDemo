//
//  WriteViewmodel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/08.
//
import RealmSwift
import SwiftUI

final class WriteViewModel {
    
    private let realm = try! Realm()
    
    func saveMemo(title: String, content: String) {
        let memoData = MemoModel()
        memoData.title = title
        memoData.content = title
        try! realm.write {
            realm.add(memoData)
        }
    }
}
