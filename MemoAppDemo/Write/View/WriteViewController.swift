//
//  WriteViewController.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import UIKit
import SnapKit

class WriteViewController: UIViewController{
    let tfTitle = UITextField()
    let tfContent = UITextView()
    let btnSaveMemo = UIButton()
    let viewModel = WriteViewModel()
    let mainViewController = MainViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(tfTitle)
        self.view.addSubview(tfContent)
        self.view.addSubview(btnSaveMemo)
        tfTitle.text = "제목을 입력해주세요"
        tfTitle.font = UIFont.systemFont(ofSize: 25)
        tfTitle.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(300)
            make.top.equalToSuperview().offset(24)
        }
        tfContent.text = "내용을 입력해주세요"
        tfContent.font = UIFont.systemFont(ofSize: 22)
        tfContent.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(320)
            make.top.equalToSuperview().offset(100)
        }
        btnSaveMemo.setTitleColor(.black, for: .normal)
        btnSaveMemo.setTitle("완료", for: .normal)
        //btnSaveMemo.backgroundColor = .black
        btnSaveMemo.addTarget(self, action: #selector(saveMemo), for: .touchUpInside)
        btnSaveMemo.snp.makeConstraints { make in
            make.height.width.equalTo(120)
            make.top.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(0)
        }
    }
    @objc func saveMemo() {
        viewModel.saveMemo(title: tfTitle.text!, content: tfContent.text!)
        self.dismiss(animated: true)
        mainViewController.getMemoList()
    }
}
