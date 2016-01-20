//
//  ViewController.swift
//  labelgame
//
//  Created by 小野山大吉 on 2015/11/25.
//  Copyright © 2015年 小野山大吉. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    var xArray: [CGFloat] = [100.0, 200.0, 300.0, 400.0] // x座標の配列
    var y0: CGFloat = -140 // y座標
    var y1: CGFloat = -140
    var y2: CGFloat = -140
    var y3: CGFloat = -140
    var y4: CGFloat = 560
    var y5: CGFloat = 560
    var y6: CGFloat = 560
    var y7: CGFloat = 560
    
    
    
    var timer1: NSTimer!
    var timer2: NSTimer!
    
    
    var downImageView0: UIImageView!
    var downImageView1: UIImageView!
    var downImageView2: UIImageView!
    var downImageView3: UIImageView!
    
    var upImageView0: UIImageView!
    var upImageView1: UIImageView!  
    var upImageView2: UIImageView!
    var upImageView3: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //２秒おきにImageVuewを作る
        timer1 = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "onUpdate1:", userInfo: nil, repeats: true)
        timer1.fire()
        
        timer2 = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdate2:", userInfo: nil, repeats: true)
        timer2.fire()
        
    }
    
    func onUpdate1(timer1 : NSTimer) {
        let randInt = Int(rand()%4)
        NSLog("\(randInt)")
        switch randInt {
        case 0:
            makeImageView0()
        case 1:
            makeImageView1()
        case 2:
            makeImageView2()
        case 3:
            makeImageView3()
        default:
            break
        }
    }
    
    func onUpdate2(timer2 : NSTimer) {
        
        if downImageView0 != nil{
            y0 = y0 + 1
            downImageView0.center = CGPointMake(60, y0)
        }
        if downImageView1 != nil{
            y1 = y1 + 1
            downImageView1.center = CGPointMake(150, y1)
        }
        if downImageView2 != nil{
            y2 = y2 + 1
            downImageView2.center = CGPointMake(240, y2)
        }
        if downImageView3 != nil{
            y3 = y3 + 1
            downImageView3.center = CGPointMake(330, y3)
        }
        if upImageView0 != nil{
            y4 = y4 - 1
            upImageView0.center = CGPointMake(60, y4)
        }
        if upImageView1 != nil{
            y5 = y5 - 1
            upImageView1.center = CGPointMake(150, y5)
        }
        if upImageView2 != nil{
            y6 = y6 - 1
            upImageView2.center = CGPointMake(240, y6)
        }
        if upImageView3 != nil{
            y7 = y7 - 1
            upImageView3.center = CGPointMake(330, y7)
        }
    }
    
    
    //ImageViewを作る機能
    func makeImageView0() {
        downImageView0 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        downImageView0.center = CGPointMake(60, y0)
        downImageView0.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        self.view.addSubview(downImageView0)
    }
    
    
    func makeImageView1() {
        downImageView1 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        downImageView1.center = CGPointMake(150, y1)
        downImageView1.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        self.view.addSubview(downImageView1)
    }
    
    
    func makeImageView2() {
        downImageView2 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        downImageView2.center = CGPointMake(240, y2)
        downImageView2.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        self.view.addSubview(downImageView2)
    }
    
    
    func makeImageView3() {
        downImageView3 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        downImageView3.center = CGPointMake(330, y3)
        downImageView3.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        self.view.addSubview(downImageView3)
    }
    @IBAction func createImage4() {
        makeImageView4()
    }
    
   //////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
       func makeImageView4() {
        if upImageView0 == nil {
        upImageView0 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        upImageView0.center = CGPointMake(60,y4)
        upImageView0.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
        self.view.addSubview(upImageView0)
        }
    }
    
    
    @IBAction func createImage5() {
        makeImageView5()
    }
    
    func makeImageView5() {
        if upImageView1 == nil {
        upImageView1 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        upImageView1.center = CGPointMake(150,y5)
        upImageView1.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
        self.view.addSubview(upImageView1)
        }
    }
    @IBAction func createImage6() {
        makeImageView6()
    }
    
    func makeImageView6() {
        if upImageView2 == nil {
        upImageView2 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        upImageView2.center = CGPointMake(240,y6)
        upImageView2.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
        self.view.addSubview(upImageView2)
        }
    }
    
    @IBAction func createImage7() {
        makeImageView7()
    }
    
    func makeImageView7() {
        if upImageView3 == nil {
        upImageView3 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        upImageView3.center = CGPointMake(330,y7)
        upImageView3.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
        self.view.addSubview(upImageView3)
        }
    }
    



    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
   
}

