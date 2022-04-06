//
//  ViewController.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import UIKit
import SnapKit
import RealmSwift
import Realm

class MainViewController: UIViewController {
    let tvAppTitle = UILabel()
    let btnCreateMemo = UIButton()
    //TODO: TableView 구현 필요
    let tbMemoList = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tvAppTitle)
        self.view.addSubview(btnCreateMemo)
        self.view.addSubview(tbMemoList)
        
        getMemoList()
        tbMemoList.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)
        tvAppTitle.text = "MemoAppDemo"
        tvAppTitle.font = UIFont.systemFont(ofSize: 30)
        tvAppTitle.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(300)
            make.top.equalToSuperview().offset(24)
        }
        tbMemoList.backgroundColor = .black
        tbMemoList.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(750)
            make.top.equalToSuperview().offset(120)
            make.edges.equalToSuperview()
        }
        
        btnCreateMemo.setTitle("메모 만들기!", for: .normal)
        btnCreateMemo.setTitleColor(.black, for: .normal)
        btnCreateMemo.addTarget(self, action: #selector(moveWriterController), for: .touchUpInside)
        btnCreateMemo.snp.makeConstraints { make in
            make.height.width.equalTo(120)
            make.top.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(0)
        }
    }
    @objc func moveWriterController() {
        let controller = WriteViewController()
        //pushViewController 함수가 작동하지 않는 이유 파악 필요
        //        self.navigationController?.pushViewController(controller, animated: true)
        self.present(controller, animated: true, completion: nil)
        
    }
    @objc func getMemoList() {
        let realm = try! Realm()
        var data: Results<Memo>
        data = realm.objects(Memo.self)
//        print(data[0].title!)
//        print(data[0].content!)
//        for i in 0...data.count {
//            print(data[i].content!)
//            print(data[i].title!)
//        }
        print(data.count)
        var i = 0
        while i < data.count {
            print(data[i].content!)
            print(data[i].title!)
            i += 1
        }
    }
}
