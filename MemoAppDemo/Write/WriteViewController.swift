//
//  WriteViewController.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import UIKit
import SnapKit

final class WriteViewController: UIViewController, UITextViewDelegate{
    
    private let titleTextView = UITextView()
    private let contentTextView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNavigation()
        setTitleTextField()
        setContentTextField()
    }
    private func setNavigation() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "메모 저장", style: .plain, target: self, action: #selector(saveMemo))
    }
    private func setContentTextField() {
        self.view.addSubview(contentTextView)
        //self.contentTextField.placeholder = "내용을 입력해주세요"
        self.contentTextView.font = .systemFont(ofSize: 16)
        self.contentTextView.layer.borderWidth = 1.0
        self.contentTextView.snp.makeConstraints{make in
            make.top.equalTo(titleTextView).inset(80)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    private func setTitleTextField() {
        self.view.addSubview(titleTextView)
        self.titleTextView.becomeFirstResponder()
        self.titleTextView.layer.borderWidth = 1.0
        self.titleTextView.font = .systemFont(ofSize: 24)
        self.titleTextView.text = "어디로 가야하죠"
        self.titleTextView.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(80)
            make.bottom.equalToSuperview().inset(200)
            make.trailing.leading.equalToSuperview().inset(16)
        }
    }
    @objc func saveMemo() {
        print("test")
        //        viewModel.saveMemo(title: tfTitle.text!, content: tfContent.text!)
        //        self.dismiss(animated: true)
        //        mainViewController.getMemoList()
    }
}
