//
//  MemoTableViewCell.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/06.
//

import UIKit
import SnapKit

class MemoTableViewCell: UITableViewCell {
    
    static let cellId = "memoCell"
    private let viewModel = MainViewModel()
    public let cellLabel = UILabel()
    let updateMemoButton = UIButton()
    public let test123 : UILabel = {
        let test1 = UILabel()
        test1.text = "테스트용 변수입니다."
        return test1
    }()
//    private var memoList : Results<Memo?> = nil
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.setLabel()
        
        self.setUpdateMemoButton()
    }
    override func layoutSubviews() {
        viewModel.memo.bind{make in
            self.setLabel()
        }
    }
    
     func setLabel() {
        self.addSubview(cellLabel)
        self.cellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        //self.cellLabel.text = title[0].title
        self.cellLabel.font = UIFont.boldSystemFont(ofSize: 25)
        self.cellLabel.snp.makeConstraints{make in
            make.leading.equalToSuperview().inset(24)
        }
    }
   
    private func setUpdateMemoButton() {
        self.contentView.addSubview(self.updateMemoButton)
        //self.updateMemoButton.addTarget(self, action: #selector(self.updateMemo), for: .touchUpInside)
        self.updateMemoButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        self.updateMemoButton.setPreferredSymbolConfiguration(.init(pointSize: 25, weight:  .regular, scale: .default), forImageIn: .normal)
        self.updateMemoButton.snp.makeConstraints{make in
            make.trailing.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
