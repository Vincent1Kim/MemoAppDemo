//
//  MemoTableViewCell.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/06.
//

import UIKit
//TODO: TableView 구현 필요
class MemoTableViewCell: UITableViewCell {
    static let identifier = "MemoCell"
    private let containerView: UIView = {
       let containerView = UIView()
        containerView.backgroundColor = .white
        return containerView
    }()
    let myView: UIView = {
        let rect = CGRect(x: 100, y: 100, width: 200, height: 200)
        let view = UIView(frame: rect)
        view.backgroundColor = .white
        
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
}
