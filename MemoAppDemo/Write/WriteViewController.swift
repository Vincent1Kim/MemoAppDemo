//
//  WriteViewController.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import UIKit
import SnapKit

final class WriteViewController: UIViewController, UITextViewDelegate{
    private let titleTextField = UITextField()
    private let contentTextView = UITextView()
    private let viewModel = WriteViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNavigation()
        setTitleTextField()
        setContentTextView()
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
//            make.trailing.equalToSuperview().
            make.height.equalTo(80)
        }
    }
    @objc func saveMemo() {
//        let controller = MainViewController()
        self.viewModel.saveMemo(title: self.titleTextField.text!, content: self.contentTextView.text!)
        self.navigationController?.popViewController(animated: true)
    }
}
