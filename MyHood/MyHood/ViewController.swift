//
//  ViewController.swift
//  MyHood
//
//  Created by shengxiang guo on 1/19/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
//        let post = Post(imagePath: "", title: "Post 1", postDesc: "Post 1 description")
//        let post1 = Post(imagePath: "", title: "Post 1", postDesc: "Post 1 description")
//        let post2 = Post(imagePath: "", title: "Post 1", postDesc: "Post 1 description")
//        
//        posts.append(post)
//        posts.append(post1)
//        posts.append(post2)
//        
//        tableView.reloadData()
        DataService.instance.loadPosts()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postsLoaded", object: nil)    
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell{
            cell.configureCell(post)
            return cell
        }else{
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 72.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func onPostsLoaded(notif:AnyObject){
        tableView.reloadData()
    }
}

