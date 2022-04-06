//
//  WriteViewModel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/06.
//

import RealmSwift
class WriteViewModel {
    func saveMemo(title: String, content: String) {
        DispatchQueue.global().async {
            let realm = try! Realm()
            let memo = Memo()
            memo.title = title
            memo.content = content
            try! realm.write {
                realm.add(memo)
            }
        }
        
    }
}
