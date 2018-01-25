//
//  ViewController.swift
//  SimpleTableDemo
//
//  Created by TiNg-LLL on 2018/1/22.
//  Copyright © 2018年 TiNg-LLL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var areas = ["温州市鹿城区","温州市龙湾区","温州市瓯海区","温州市洞头区","杭州市萧山区","杭州市江干区","杭州市上城区","杭州市下城区","杭州市滨江区"]    //定义一个数组
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count  //返回areas的行数，告诉table有多少行
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) //定义原型单元格，在storyboard里重命名的单元格Cell，indexpath是位置信息
        
        cell.textLabel?.text = areas[indexPath.row]  //显示的文字为数组中相应的文字
        cell.imageView?.image = #imageLiteral(resourceName: "xining")    //table前面加图片
        
        return cell
        
    }

    override var prefersStatusBarHidden: Bool {  //隐藏状态栏
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

