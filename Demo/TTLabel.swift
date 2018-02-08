//
//  TTLabel.swift
//  Demo
//
//  Created by TangChi on 2018/2/8.
//  Copyright © 2018年 TangChi. All rights reserved.
//


import UIKit

class TTLabel: UILabel {
    
    /// 属性文本存储
    private let textStorage = NSTextStorage()
    
    /// 设置文本绘制的范围
    private lazy var textContainer: NSTextContainer = {
        let textContainer = NSTextContainer(size: CGSize(width: frame.size.width,
                                                         height: CGFloat.greatestFiniteMagnitude))
        return textContainer
    }()
    
    /// 布局管理器 负责 字形 布局
    private var layoutManager: NSLayoutManager?
    
    init(frame: CGRect, layout: NSLayoutManager) {
        super.init(frame: frame)
        
        self.layoutManager = layout
        self.layoutManager?.addTextContainer(textContainer)
        self.textStorage.addLayoutManager(layoutManager!)
    }
    
    override var attributedText: NSAttributedString? {
        didSet {
            prepareTextContent()
        }
    }
    
    override var text: String? {
        didSet {
            prepareTextContent()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawText(in rect: CGRect) {
        // 绘制背景
        let range = NSRange(location: 0, length: textStorage.length)
        layoutManager?.drawBackground(forGlyphRange: range, at: CGPoint(x: 0, y: 0))
        
        // 绘制字形
        layoutManager?.drawGlyphs(forGlyphRange: range, at: CGPoint(x: 0, y: 0))
        
    }
    
    private func prepareTextContent() {
        
        if let attributedText = attributedText {
            textStorage.setAttributedString(attributedText)
        } else if let text = text {
            textStorage.setAttributedString(NSAttributedString(string: text))
        } else {
            textStorage.setAttributedString(NSAttributedString(string: ""))
        }
    }
    
}
