//
//  ViewController.swift
//  Test_NavigationBarWithStatusColor
//
//  Created by zhaoyou on 16/3/15.
//  Copyright © 2016年 zhaoyouwang. All rights reserved.
//

import UIKit

private let cellIdentifier = "cellIdentifier"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupNavBar()
        setupUI()
    }
    
    private func setupNavBar() {
        navigationItem.title = "导航栏滑动渐变demo"
        navigationController?.navigationBar.customMyBackgroundColor(UIColor.brownColor())
        navigationController?.navigationBar.customMyBackgroundColorAlpha(0)
    }
    
    private func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(myTableView)
    }

    private lazy var myTableView: UITableView = {
        let tv = UITableView(frame: CGRect(x: 0, y: 64, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height), style: UITableViewStyle.Plain)
        tv.dataSource = self
        tv.delegate = self
        tv.registerClass(UITableViewCell.self , forCellReuseIdentifier: cellIdentifier)
        
        return tv
    }()
    
    private lazy var titlesArr: [String] = ["测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试","测试"]

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = titlesArr[indexPath.row] + "    \(indexPath.row % 2 == 0 ? "奇数" : "偶数")"
        
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let delta: CGFloat = scrollView.contentOffset.y
        let alpha = CGFloat(( -64 + delta) / (view.frame.height))
        navigationController?.navigationBar.customMyBackgroundColorAlpha(alpha)
    }
}

