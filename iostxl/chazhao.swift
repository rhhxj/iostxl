//
//  chazhao.swift
//  iostxl
//
//  Created by admin on 16/7/13.
//  Copyright © 2016年 20141105047. All rights reserved.
//

import UIKit

class chazhao: UIViewController {
    
    
    var db:SQLiteDB!
    
    @IBOutlet weak var text: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
        //如果有数据则加载
        //initUser()
    }
    
    @IBAction func xianshi(sender: AnyObject) {
        selete()
    }
    
    func selete(){
        text.text=""
        
        let data = db.query("select * from user")
        
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            text.text! += "姓名：" + String(tuser["uname"]!) + " 电话：" + String(tuser["mobile"]!)  + " email：" + String(tuser["email"]!) +  " 地址：" + String(tuser["address"]!)+"\n"
        }
        
    }
    @IBAction func qingkong(sender: AnyObject) {let sql = "delete from user"
        let result = db.execute(sql)
        print(result)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //保存数据到SQLite
    
    
}
