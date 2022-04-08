//
//  ViewController.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import UIKit
import SnapKit
class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    private let appLabel = UILabel()
    private let MemoListTable = UITableView()
    private let viewModel = MainViewModel()
    private let customCell = MemoTableViewCell()
    private let rightButton : UIButton = {
        let button = UIButton()
        button.setPreferredSymbolConfiguration(.init(pointSize: 28, weight:  .regular, scale: .default), forImageIn: .normal)
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.addTarget(MainViewController.self, action: #selector(moveWriterController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        self.setTableView()
        viewModel.getMemoListLength()
    }
    
    private func setTableView() {
        self.view.addSubview(MemoListTable)
        self.MemoListTable.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.cellId)
        self.MemoListTable.rowHeight = 60
        self.MemoListTable.delegate = self
        self.MemoListTable.dataSource = self
        self.MemoListTable.snp.makeConstraints{ make in
            make.width.height.equalToSuperview()
            make.top.equalToSuperview().inset(100)
        }
    }
    
    private func setNavigation() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "DemoMemo"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(moveWriterController))
    }
    
    @objc func moveWriterController() {
        let controller = WriteViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var length : Int = 0
        viewModel.memoLength.bind{ make in
            length = make
            print(make)
        }
        
        return length
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.cellId) as! MemoTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
}
