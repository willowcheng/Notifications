//
//  ViewController.swift
//  Notifications
//
//  Created by Liu Cheng on 2015-05-28.
//  Copyright (c) 2015 Liu Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "drawAShape", name: "actionOnePressed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showAMessage", name: "actionTwoPressed", object: nil)
        
        var dateComp: NSDateComponents = NSDateComponents()
        dateComp.year = 2015;
        dateComp.month = 5;
        dateComp.day = 28;
        dateComp.hour = 14;
        dateComp.minute = 15;
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        var calender: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        var date: NSDate = calender.dateFromComponents(dateComp)!
        
        var notification: UILocalNotification = UILocalNotification()
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = "Hi, I am a notification"
        notification.fireDate = date
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        
    }
    
    func drawAShapre(notification: NSNotification) {
        var view: UIView = UIView(frame: CGRectMake(10, 10, 100, 100))
        view.backgroundColor = UIColor.redColor()
        self.view.addSubview(view)
    }
    
    func showAMessage(notification: NSNotification) {
        var message: UIAlertController = UIAlertController(title: "A Notification Message", message: "Hello there", preferredStyle: .Alert)
        message.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(message, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

