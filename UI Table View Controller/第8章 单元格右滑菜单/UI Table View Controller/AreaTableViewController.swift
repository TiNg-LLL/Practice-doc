//
//  AreaTableViewController.swift
//  UI Table View Controller
//
//  Created by TiNg-LLL on 2018/1/25.
//  Copyright © 2018年 TiNg-LLL. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {
    
    var areas = ["温州市鹿城区","温州市龙湾区","温州市瓯海区","温州市洞头区","杭州市萧山区","杭州市江干区","杭州市上城区","杭州市下城区","杭州市滨江区"]

    var areaImages = ["xinzhuang","qilihe","youxi","chengxi","baiyun","shangjie","nangang","yaodu","wuhou","jinping","furong"]
    
    var provinces = ["上海","甘肃","福建","青海","广东","福建","黑龙江","山西","四川","广东","湖南"]
    
    var parts = ["华东","西北","东南","西北","华南","东南","东北","华北","西南","华南","华中"]
    
    var visited = [Bool](repeatElement(false, count: 11)) //创建里面有11个false的数组
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let actionShare = UITableViewRowAction(style: .normal, title: "分享") { (_, indexPath) in
            let actionSheet = UIAlertController(title: "分享至", message: nil, preferredStyle: .actionSheet)
            let option1 = UIAlertAction(title: "QQ", style: .default, handler: nil)
            let option2 = UIAlertAction(title: "微信", style: .default, handler: nil)
            let optionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            actionSheet.addAction(option1)
            actionSheet.addAction(option2)
            actionSheet.addAction(optionCancel)
            
            self.present(actionSheet, animated: true, completion: nil)
        }
        
        actionShare.backgroundColor = UIColor.orange
        
            let actionDel = UITableViewRowAction(style: .destructive, title: "删除"){ (_, indexPath) in
                self.areaImages.remove(at: indexPath.row)
                self.areas.remove(at: indexPath.row)
                self.provinces.remove(at: indexPath.row)
                self.parts.remove(at: indexPath.row)
                self.visited.remove(at: indexPath.row)
                
                //            print("删除一行后还剩的区域数目：",self.areas.count)
                //            for area in areas {
                //                print(area)
                //            }
                
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let actionTop = UITableViewRowAction(style: .default, title: "置顶") { (_, _) in
            
        }
        
        actionTop.backgroundColor = UIColor(red: 245/255, green: 199/255, blue: 221/255, alpha: 1)
        
        
        return[actionShare,actionDel,actionTop]
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //didSelectRowAt 点击一行后进行反应。
//        print("您点击了",indexPath.section,"组",indexPath.row,"行")
        
        let menu = UIAlertController(title: "您好", message: "您点击了第\(indexPath.row)行", preferredStyle: .actionSheet) //新建一个UIAlertController提示 .actionSheet是操作菜单

        let option2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)  //新建一个提示后可以的操作的按钮
        
        let option3 = UIAlertAction(title: "我去过", style: .default) { (_) in  //新建一个提示后可以的操作的按钮,handler就是定义点击之后的一个操作，回车后变成in。。。
            let cell = tableView.cellForRow(at: indexPath) //获取单元格的位置，给cell
            cell?.accessoryType = .checkmark //相应的单元格，做一些系统自带的标记 .checkmark 是打勾☑️
            self.visited[indexPath.row] = true //更新创建的数组中相应点击的行改为true
        }
        
        menu.addAction(option2) //将新建的操作菜单2增加到新建的提示
        
        menu.addAction(option3) //将新建的操作菜单3增加到新建的提示
        
        self.present(menu, animated: true, completion: nil) //要将新建的提示进行显示
        
        tableView.deselectRow(at: indexPath, animated: true) //取消选中状态，如果没有这一行，点击选中一行后，是一直维持选中状态。
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {  //numberOfSections，这个列表有几个区块 默认就是一个区块，默认是1 这个func可以删除去掉。
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //numberOfRowsInSection,这个列表有多少行，override是忽略父类的定义，子类重新定义。
        // #warning Incomplete implementation, return the number of rows
        return areas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell //as 类型转换，从一个类型转换到另一个类型，原来是UITableView 转换成CustomTableView ， as!强制                          转换(失败app会奔溃) as?安全转换(失败不会奔溃)

        cell.NameLabel.text = areas[indexPath.row] // NameLabel是在CustomTableViewCell中定义的。
        cell.ProvinceLabel.text = provinces[indexPath.row]
        cell.PartLabel.text = parts[indexPath.row]
        cell.ThumbImageView.image = UIImage(named: areaImages[indexPath.row]) // ThumbImageView是在CustomTableViewCell中定义的。
        cell.ThumbImageView.layer.cornerRadius = cell.ThumbImageView.frame.size.height/2  //cornerRadius是角半径  frame是长方形的尺寸属性
        cell.ThumbImageView.clipsToBounds = true //使layer裁边生效。
        
        if visited[indexPath.row] {   //从数组中判断是false还是true 判断是☑️还是none，以消除复选Bug。
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            
//            tableView.reloadData()  //用刷新列表的方法删除，没有动画效果
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    

    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
