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
    var yDown0: CGFloat = -140 // y座標
    var yDown1: CGFloat = -140
    var yDown2: CGFloat = -140
    var yDown3: CGFloat = -140
    var yUp0: CGFloat = 560
    var yUp1: CGFloat = 560
    var yUp2: CGFloat = 560
    var yUp3: CGFloat = 560
    
    
    
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
    
    //0~3の中から一つ選んでImageView作る
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
    
    //ImageViewを動かす
    func onUpdate2(timer2 : NSTimer) {
        
        if downImageView0 != nil{
            yDown0 = yDown0 + 1
            downImageView0.center = CGPointMake(60, yDown0)
        }
        if downImageView1 != nil{
            yDown1 = yDown1 + 1
            downImageView1.center = CGPointMake(150, yDown1)
        }
        if downImageView2 != nil{
            yDown2 = yDown2 + 1
            downImageView2.center = CGPointMake(240, yDown2)
        }
        if downImageView3 != nil{
            yDown3 = yDown3 + 1
            downImageView3.center = CGPointMake(330, yDown3)
        }
        
        
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
        
        if upImageView0 != nil{
            if yUp0 >= 100 {
                yUp0 = yUp0 - 1
                upImageView0.center = CGPointMake(60, yUp0)
            }else{
                upImageView0.removeFromSuperview()
                upImageView0 = nil

                
            }
        }
        
        if upImageView1 != nil{
            if yUp1 >= 100 {
                yUp1 = yUp1 - 1
                upImageView1.center = CGPointMake(150, yUp1)
            }else{
            upImageView1.removeFromSuperview()
            upImageView1 = nil
            }
        }
        if upImageView2 != nil{
            if yUp2 >= 100 {
                yUp2 = yUp2 - 1
                upImageView2.center = CGPointMake(240, yUp2)
            }else{
                upImageView2.removeFromSuperview()
                upImageView2 = nil
            }
        }
        if upImageView3 != nil{
            if yUp3 >= 100{
                yUp3 = yUp3 - 1
                upImageView3.center = CGPointMake(330, yUp3)
            }else{
                upImageView3.removeFromSuperview()
                upImageView3 = nil
            }
        }
    }
    
    
    //ImageViewを作る機能
    func makeImageView0() {
        downImageView0 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        downImageView0.center = CGPointMake(60, yDown0)
        downImageView0.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        self.view.addSubview(downImageView0)
    }
    
    
    func makeImageView1() {
        downImageView1 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        downImageView1.center = CGPointMake(150, yDown1)
        downImageView1.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        self.view.addSubview(downImageView1)
    }
    
    
    func makeImageView2() {
        downImageView2 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        downImageView2.center = CGPointMake(240, yDown2)
        downImageView2.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.3)
        self.view.addSubview(downImageView2)
    }
    
    
    func makeImageView3() {
        downImageView3 = UIImageView(frame: CGRectMake(0, 0, 60, 60))
        downImageView3.center = CGPointMake(330, yDown3)
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
        upImageView0.center = CGPointMake(60,yUp0)
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
        upImageView1.center = CGPointMake(150,yUp1)
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
        upImageView2.center = CGPointMake(240,yUp2)
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
        upImageView3.center = CGPointMake(330,yUp3)
        upImageView3.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.3)
        self.view.addSubview(upImageView3)
        }
    }


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
   
}

