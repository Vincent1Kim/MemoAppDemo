//
//  MemoTableViewCell.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/06.
//

import UIKit
import SnapKit
import RealmSwift

final class MemoTableViewCell: UITableViewCell {
    private let viewModel = MainViewModel()
    private let cellLabel = UILabel()
    private let updateMemoButton = UIButton()
    private let delMemoButton = UIButton()
//    private var memoList : Results<Memo?> = nil
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLabel()
        self.setDelMemoButton()
        self.setUpdateMemoButton()
        
    }
    override func layoutSubviews() {
        
    }
    private func setLabel() {
        self.addSubview(cellLabel)
        self.cellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.cellLabel.text = "메모"
        self.cellLabel.font = UIFont.boldSystemFont(ofSize: 25)
        self.cellLabel.snp.makeConstraints{make in
            make.leading.equalToSuperview().inset(24)
        }
    }
    
    private func setDelMemoButton() {
        self.contentView.addSubview(self.delMemoButton)
        self.delMemoButton.addTarget(self, action: #selector(self.delMemo), for: .touchUpInside)
        self.delMemoButton.setImage(UIImage(systemName: "trash"), for: .normal)
        self.delMemoButton.setPreferredSymbolConfiguration(.init(pointSize: 25, weight:  .regular, scale: .default), forImageIn: .normal)
        self.delMemoButton.snp.makeConstraints{make in
            make.trailing.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setUpdateMemoButton() {
        self.contentView.addSubview(self.updateMemoButton)
        self.updateMemoButton.addTarget(self, action: #selector(self.updateMemo), for: .touchUpInside)
        self.updateMemoButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        self.updateMemoButton.setPreferredSymbolConfiguration(.init(pointSize: 25, weight:  .regular, scale: .default), forImageIn: .normal)
        self.updateMemoButton.snp.makeConstraints{make in
            make.trailing.equalTo(self.delMemoButton).inset(38)
            make.centerY.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    //메모 수정 구현 필요
    @objc func updateMemo() {
        //viewModel.getMemoList()
        print("click update memo!")
    }
    //메모 삭제 구현 필요
    @objc func delMemo() {
        print("click del memo!")
    }
}
