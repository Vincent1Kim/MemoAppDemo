//
//  MemoDB.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import Foundation
import RealmSwift

class MemoDB: Object {
    @Persisted(primaryKey: true) var title: String?
    @Persisted var content: String?
}
