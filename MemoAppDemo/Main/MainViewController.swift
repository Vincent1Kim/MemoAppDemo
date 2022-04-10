//
//  ViewController.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import UIKit
import SnapKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UpdateMemoDelegate {
    func updateMemo(memoIdx: Int) {
        print(memoIdx)
    }
    
    
    var delegate : WriteViewController?
    var array = Array<MemoModel>()
    private let appLabel = UILabel()
    private let memoTableView = UITableView()
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
        self.viewModel.getMemo()
        viewModel.memo.bind{ make in
            for index in 0..<make!.count{
                self.array.append(make![index])
            }
        }
    }
    
    private func setTableView() {
        self.view.addSubview(memoTableView)
        self.memoTableView.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.cellId)
        self.memoTableView.rowHeight = 60
        self.memoTableView.delegate = self
        self.memoTableView.dataSource = self
        self.memoTableView.snp.makeConstraints{ make in
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
        return array.count
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView ,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.cellId) as! MemoTableViewCell
        cell.selectionStyle = .none
        viewModel.memo.bind{make in
            cell.cellLabel.text = make![indexPath.row].title
        }
        cell.updateMemoButton.addTarget(self, action: #selector(updateMemo(index:)), for: .touchUpInside)
        cell.updateMemoButton.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.delMemo(index: indexPath.row)
            self.array.remove(at: indexPath.row)
            self.memoTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
  
    @objc func updateMemo(index : UIButton) {
        let controller = WriteViewController()
        self.delegate = controller
        delegate?.updateMemo(memoIdx: index.tag)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
