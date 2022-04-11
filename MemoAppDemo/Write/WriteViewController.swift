//
//  WriteViewController.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import UIKit
import SnapKit

protocol UpdateMemoDelegate: AnyObject {
    func updateMemo(memoIdx: Int)
}

final class WriteViewController: UIViewController, UITextViewDelegate, UpdateMemoDelegate{
    private var idx : Int? = nil
    private let titleTextField = UITextField()
    private let contentTextView = UITextView()
    private let viewModel = WriteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNavigation()
        setTitleTextField()
        setContentTextView()
        viewModel.memo.bind{make in
            self.titleTextField.text = make?[0].title
            self.contentTextView.text = make?[0].content
        }
    }
    
    func updateMemo(memoIdx: Int) {
        idx = memoIdx
        viewModel.getMemo(idx: memoIdx)
        print(memoIdx)
    }
    
    private func setNavigation() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "메모 저장", style: .plain, target: self, action: #selector(saveMemo))
    }
    
    private func setContentTextView() {
        self.view.addSubview(contentTextView)
        self.contentTextView.text = "내용을 입력해주세요"
        self.contentTextView.font = .systemFont(ofSize: 20)
        self.contentTextView.layer.borderWidth = 1.0
        self.contentTextView.snp.makeConstraints{make in
            make.top.equalTo(titleTextField).inset(80)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    private func setTitleTextField() {
        self.view.addSubview(titleTextField)
        self.titleTextField.placeholder = "제목"
        self.titleTextField.layer.borderWidth = 1.0
        self.titleTextField.textAlignment = .center
        self.titleTextField.font = .systemFont(ofSize: 24)
        self.titleTextField.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(80)
        }
    }
    
    @objc func saveMemo() {
        if idx != nil {
            self.viewModel.updateMemo(idx: idx!, title: self.titleTextField.text!, content: self.contentTextView.text)
            self.navigationController?.popViewController(animated: true)
        }else {
            self.viewModel.saveMemo(title: self.titleTextField.text!, content: self.contentTextView.text!)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
