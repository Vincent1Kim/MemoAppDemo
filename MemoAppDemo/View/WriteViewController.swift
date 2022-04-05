//
//  WriteViewController.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import UIKit
import SnapKit

class WriteViewController: UIViewController{
    let tvExample = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tvExample)
        tvExample.text = "이곳은 메모를 작성하는 화면입니다."
        tvExample.font = UIFont.systemFont(ofSize: 30)
        tvExample.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
