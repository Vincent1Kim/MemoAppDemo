//
//  MainViewModel.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/08.
//

import RealmSwift
//
//protocol MainViewModelProtocol {
//    var memo: Observable<Results<MemoModel>?>{get set}
//}

final class MemoDababase {
    static private let realm = try! Realm()
    
    static private var memo: Observable<Results<MemoModel>?> = Observable(nil)
    
    static func getMemo() {
        print(realm.objects(MemoModel.self))
        memo.value = realm.objects(MemoModel.self)
    }
    
    static func delMemo(index : Int) {
        let memoData = realm.objects(MemoModel.self)
        try! self.realm.write{
            self.realm.delete(memoData[index])
        }
    }
}

final class MainViewModel {
    var memo: Observable<Results<MemoModel>?>
    
    private var array : Array<MemoModel?> = []
    
    init() {
        setupBindings()
    }
    
    func updateMemo() {
        
    }
    
    
    private func setupBindings() {
//        memo.bind{ make in
//            guard let memoList: Results<MemoModel> = make else { return }
//            for index in 0..<memoList.count {
//                self.array.append(memoList[index])
//            }
//        }
    }
    
    
}
