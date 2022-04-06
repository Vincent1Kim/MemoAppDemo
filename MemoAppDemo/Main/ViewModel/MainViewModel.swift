//
//  MainViewModel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import RealmSwift

class MainViewModel : ObservableObject {
    func delMemo() {
        DispatchQueue.global().async {
            let realm = try! Realm()
            let memo = Memo()
            try! realm.write {
                realm.delete(memo)
            }
        }
    }
}
