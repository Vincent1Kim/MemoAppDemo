//
//  ViewController.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController, UITableViewDataSource  {
    
    private let appLabel = UILabel()
    private let MemoListTable = UITableView()
    private let viewModel = MainViewModel()
    
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
        viewModel.getMemoList()
        viewModel.memoLength.bind{ make in
            print("아니 이거 왜 이래 \(make)")
        }
    }
    
    private func setTableView() {
        self.view.addSubview(MemoListTable)
        self.MemoListTable.register(MemoTableViewCell.self, forCellReuseIdentifier: "cell")
        self.MemoListTable.dataSource = self
        self.MemoListTable.rowHeight = 60
        self.MemoListTable.snp.makeConstraints{ make in
            make.width.height.equalToSuperview()
            make.top.equalToSuperview().inset(100)
        }
    }
    
    private func setNavigation() {
        //        let menuBarItem = UIBarButtonItem(customView: self.rightButton)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "DemoMemo"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(moveWriterController))
    }
    
    @objc func moveWriterController() {
        let controller = WriteViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    //cell의 갯수 (임의로 설정)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var length = 0
        viewModel.memoLength.bind{ make in
            length = make
        }
        
        return length
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UITableViewCell = self.MemoListTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MemoTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
}
