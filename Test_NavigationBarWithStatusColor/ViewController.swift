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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        scrollViewDidScroll(myTableView)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.resetNavBar()
    }

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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "详情", style: UIBarButtonItemStyle.Plain, target: self, action: "rightItemClick")
    }
    
    private func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(myTableView)
    }
    
    func rightItemClick() {
        let detali = DetailViewController()
        
        navigationController?.pushViewController(detali, animated: true)
    }

    private lazy var myTableView: UITableView = {
        let tv = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height), style: UITableViewStyle.Plain)
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
        cell.backgroundColor = UIColor.yellowColor()
        
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let color = UIColor(red: 0 / 255.0, green: 175 / 255.0, blue: 240 / 255.0, alpha: 1)
        let offsetY: CGFloat = scrollView.contentOffset.y
        if offsetY > 50 {
            let alpha = min(1, 1 - ((50 + 64 - offsetY) / 64))
            navigationController?.navigationBar.customMyBackgroundColor(color.colorWithAlphaComponent(alpha))
        } else {
            navigationController?.navigationBar.customMyBackgroundColor(color.colorWithAlphaComponent(0))
        }
    }
}

