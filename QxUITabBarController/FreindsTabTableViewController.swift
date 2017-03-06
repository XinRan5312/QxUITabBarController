//
//  FreindsTabTableViewController.swift
//  QxUITabBarController
//
//  Created by 新然 on 17/3/2.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

import UIKit

class FreindsTabTableViewController: UITableViewController ,UISearchResultsUpdating,UISearchBarDelegate{
    let friendsData=CreatDataUitls.creatFriendsData()
    let searcherController=UISearchController(searchResultsController: nil)
    let titleIndex=["A","B","C"]
    var filterDatas=[[FriendModle]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchBar()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func initSearchBar(){
     searcherController.searchBar.tintColor=UIColor.blueColor()
        searcherController.searchBar.placeholder="搜索联系人"
        searcherController.searchResultsUpdater=self
        searcherController.searchBar.delegate=self
        searcherController.dimsBackgroundDuringPresentation=true
        searcherController.hidesNavigationBarDuringPresentation=true
        searcherController.searchBar.sizeToFit()
        self.tableView.tableHeaderView=searcherController.searchBar
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
       let searcheStr=searcherController.searchBar.text
        let searPredicate=NSPredicate(format: "SELF CONTAINS %@", searcheStr!)
        let n=friendsData?.count
          let m=NSMutableArray()
        for var i=0;i<n;++i{
           let one=friendsData![i]
            for var j=0;j<one.count;++j{
             m.addObject(one[j])
            }
            let d=m.filteredArrayUsingPredicate(searPredicate)
            var d1=[FriendModle]()
            for var p=0;p<d.count;++p{
               d1.append(d[p] as! FriendModle)
            }
            filterDatas.append(d1)
        }
        
        self.tableView.reloadData()
    }
//    func searchBarBookmarkButtonClicked(searchBar: UISearchBar) {
//        
//    }
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        
//    }
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        
//    }
//    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
//        
//    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if(self.searcherController.active){
             return 1
        }
        return (friendsData?.count)!
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(self.searcherController.active){
            filterDatas[section].count
        }
        return friendsData![section].count
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section==0{
        return 0
        }else{
        return 25
        }
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    //返回索引数据源
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return titleIndex
    }
    //设置每个header的title
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section==0{
        return ""
        }else{
        return titleIndex[section-1]
        }
    }
    //设置点击对应的index索引后移动到相应的section
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return index+1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        cell=tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let imgView = cell!.viewWithTag(100)as!UIImageView
        let text=cell!.viewWithTag(101) as!UILabel
        if(self.searcherController.active){
            imgView.image=filterDatas[indexPath.section][indexPath.row].img
            text.text=filterDatas[indexPath.section][indexPath.row].name
        }else{
           
            imgView.image=friendsData![indexPath.section][indexPath.row].img
            text.text=friendsData![indexPath.section][indexPath.row].name
        }
       
        
        
      
        return cell!
    }
    //如果不这么做切换到下个view的时候SearcherController会短暂的存在
    override func viewWillDisappear(animated: Bool) {
        if(self.searcherController.active){
        self.searcherController.active=false
            self.searcherController.searchBar.removeFromSuperview()
        
        }
    }
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
