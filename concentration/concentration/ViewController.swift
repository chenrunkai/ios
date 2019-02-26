//
//  ViewController.swift
//  concentration
//
//  Created by 陈润恺 on 2019/2/26.
//  Copyright © 2019年 陈润恺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func Is_None(on button:UIButton)->Bool{
        return button.currentTitle != "😀"
            &&
            button.currentTitle != "😇"
            &&
            button.currentTitle != "😂"
            &&
            button.currentTitle != "😅"
    }
    
    @IBOutlet weak var FlipCountLable: UILabel!
    
    var S1 :String = ""
    var S2 :String = ""
    var N1 :Int = 0
    var N2 :Int = 0
    
    var FlipCount = 0{
        didSet{
            FlipCountLable.text = "Flips: \(FlipCount)"
        }
    }
    @IBOutlet weak var RightCount: UILabel!
    @IBOutlet weak var Win: UILabel!
    
    var WrongNumber = 0
    
    var RightNumber = 0{
        didSet{
            RightCount.text = "Right: \(RightNumber)"
            if RightNumber == 8 {
                Win.text = "You win !!"
            }
        }
    }
    let TitleEmoji = ["😀","😇","😂","😇","😂","😅","😅","😀"]
    
    @IBOutlet var CardButtons: [UIButton]!
    
    @IBAction func TouchCard(_ sender: UIButton) {
        if  Is_None(on: sender)
            {
            let CurrentCardNumber = CardButtons.index(of: sender)!
            FlipCard(WithEmoji:TitleEmoji[CurrentCardNumber], on: sender)
                FlipCount += 1
                if FlipCount&1 == 1{
                    S1=TitleEmoji[CurrentCardNumber]
                    N1=CurrentCardNumber
                }
                else{
                    S2=TitleEmoji[CurrentCardNumber]
                    N2=CurrentCardNumber
                    print(N1," ",N2)
                    if S1 != S2 {
                        //to do: delay for 2 second
                        FlipCard(WithEmoji:S1, on: CardButtons[N1])
                        FlipCard(WithEmoji:S2, on: CardButtons[N2])
                        WrongNumber += 2
                    }
                }
            RightNumber = FlipCount - WrongNumber
        }
    }
    func FlipCard (WithEmoji emoji:String,on button:UIButton ){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor=#colorLiteral(red: 1, green: 0.1495025158, blue: 0.07090275735, alpha: 1)
        }
        else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

}


