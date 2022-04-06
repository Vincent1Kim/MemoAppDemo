//
//  MemoDB.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import RealmSwift

class Memo: Object {
    @objc dynamic var title: String?
    @objc dynamic var content: String?
   
}
