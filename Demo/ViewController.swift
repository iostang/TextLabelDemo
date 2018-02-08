//
//  ViewController.swift
//  Demo
//
//  Created by TangChi on 2018/2/8.
//  Copyright © 2018年 TangChi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let lab = TTLabel(frame: CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width-20, height: 300), layout: TTLayoutManger())
        lab.numberOfLines = 0
        lab.font = UIFont.systemFont(ofSize: 12)
        lab.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        lab.attributedText = labText()
        view.addSubview(lab)
        
    }
    
    func labText() -> NSMutableAttributedString {
        let paragraphStyle1 = NSMutableParagraphStyle()
        paragraphStyle1.lineSpacing = 8     //设置行间距
        paragraphStyle1.alignment = .left
        
        let ast = NSMutableAttributedString(string: "iOS 7 的发布给开发者的案头带来了很多新工具。其中一个就是 TextKit。TextKit 由许多新的 UIKit 类组成，顾名思义，这些类就是用来处理文本的。在这里，我们将介绍 TextKit 的来由、它的组成，以及通过几个例子解释开发者怎样将它派上大用场。\n但是首先我们得先阐明一个观点：TextKit 可能是近期对 UIKit 最重要的补充了。iOS 7 的新界面用纯文本按钮替换了大量的图标和边框。总的来说，文本和文本布局在新 OS 系统的视觉效果中所占有的重要性大大提高了。iOS7 的重新设计完全是被文本驱动，这样说也许并不夸张——而文本全部是 TextKit 来处理的。\n告诉你这个变动到底有多大吧：iOS7 之前的所有版本，（几乎）所有的文本都是 WebKit 来处理的。对：WebKit，web 浏览器引擎。所有 UILabel、UITextField，以及 UITextView 都在后台以某种方式使用 web views 来进行文本布局和渲染。为了新的界面风格，它们全都被重新设计以使用 TextKit。")
        ast.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.white,
                           NSAttributedStringKey.backgroundColor: UIColor.black.withAlphaComponent(0.7),
                           NSAttributedStringKey.paragraphStyle: paragraphStyle1],
                          range: NSRange(location: 0, length: ast.string.count))
        
        return ast
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
