//
//  Memo.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/08.
//

import RealmSwift


final class MemoModel: Object {
    @objc dynamic var idx: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
}
final class Memo: Object {
    @objc dynamic var title: String?
    @objc dynamic var content: String?
}
