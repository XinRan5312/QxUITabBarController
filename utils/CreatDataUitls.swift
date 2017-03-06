//
//  CreatDataUitls.swift
//  QxUITabBarController
//
//  Created by 新然 on 17/3/2.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

import Foundation
import UIKit
class CreatDataUitls: NSObject {
    
    class func createMsgData()->[MsgModle]?{
         var msgDatas=[MsgModle]()
         let msg1=MsgModle()
         msg1.img=UIImage(named: "qq")
        msg1.title="腾讯新闻"
        msg1.subTitle="腾讯成功收购了LOL，以后LOL可以飞速发展了"
       let t1=NSDate()
        let formate=NSDateFormatter()
        formate.dateFormat="yyyy-MM-dd HH:mm:ss"
        msg1.data=formate.stringFromDate(t1)
        let t2=NSDate(timeInterval: 12*60*60, sinceDate: t1)
        let msg2=MsgModle()
        msg2.img=UIImage(named: "Twitter_Bottle")
        msg2.title="推特新闻"
        msg2.subTitle="川普大叔又在推特发布惊人的言论"
        msg2.data=formate.stringFromDate(t2)
        msgDatas.append(msg1)
        msgDatas.append(msg2)
        

        
    return msgDatas
    
    }
    
   class func  creatFriendsData()->[[FriendModle]]?{
    var friendsData:[[FriendModle]]=[]
    var friends1=[FriendModle]()
    for _ in 0...5{
    let fre=FriendModle()
        fre.img=UIImage(named: "friends_48px")
        fre.name="新朋友"
        friends1.append(fre)
    }
    friendsData.append(friends1)
    
    var friends2=[FriendModle]()
    for _ in 0...6{
    let fre=FriendModle()
        fre.img=UIImage(named: "artist_48px")
        fre.name="艺术家"
        friends2.append(fre)
    }
    friendsData.append(friends2)
    
    var friends3=[FriendModle]()
    for _ in 0...9{
    let fre=FriendModle()
        fre.img=UIImage(named:"baby_48px")
        fre.name="婴儿"
        friends3.append(fre)
    }
    friendsData.append(friends3)
    
    var friends4=[FriendModle]()
    for _ in 0...4{
    let fre=FriendModle()
        fre.img=UIImage(named: "boy_48px")
        fre.name="男生"
        friends4.append(fre)
    }
    friendsData.append(friends4)
    return friendsData
    
    }
}
