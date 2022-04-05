//
//  ViewController.swift
//  MemoAppDemo
//
//  Created by vex on 2022/04/05.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let tvAppName = UILabel()
    let btnCreateMemo = UIButton()
    //let tbMemoList = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tvAppName)
        self.view.addSubview(btnCreateMemo)
        
        tvAppName.text = "MemoAppDemo"
        tvAppName.font = UIFont.systemFont(ofSize: 30)
        tvAppName.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(300)
            make.top.equalToSuperview().offset(24)
        }
        
        btnCreateMemo.setTitle("메모 만들기!", for: .normal)
        btnCreateMemo.setTitleColor(.black, for: .normal)
        //ivCreateMemo.backgroundColor = .red
        btnCreateMemo.addTarget(self, action: #selector(printLog), for: .touchUpInside)
        btnCreateMemo.snp.makeConstraints { make in
            make.height.width.equalTo(120)
            make.top.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(0)
            //make.center.equalToSuperview()
        }
    }
    @objc func printLog() {
        let controller = WriteViewController()
        print("button clicked!")
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
}
