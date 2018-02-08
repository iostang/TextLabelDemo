//
//  TTLayoutManger.swift
//  Demo
//
//  Created by TangChi on 2018/2/8.
//  Copyright © 2018年 TangChi. All rights reserved.
//

import UIKit

class TTLayoutManger: NSLayoutManager {
    
    /// Draws background marks for the given glyph range, which must lie completely within a single text container.
    override func drawBackground(forGlyphRange glyphsToShow: NSRange, at origin: CGPoint) {
        
        /// Enumerates line fragments intersecting with the given glyph range.
        enumerateLineFragments(forGlyphRange: glyphsToShow) { (rect, usedRect, container, glyphRange, stop) in
            
            /// rect: The current line fragment rectangle.
            
            /// usedRect: The portion of the line fragment rectangle that actually contains glyphs or other marks that are drawn (including the text container’s line fragment padding).
            
            /// textContainer: The text container in which the glyphs are laid out.
            
            /// glyphRange: The range of glyphs laid out in the current line fragment.
            
            /// stop: A reference to a Boolean value. The block can set the value to true to stop further processing of the array. The stop argument is an out-only argument. You should only set this Boolean to true within the block.

            var range = glyphRange
            if let color = self.textStorage?.attribute(NSAttributedStringKey.backgroundColor,
                                                       at: glyphRange.location,
                                                       effectiveRange: &range) as? UIColor {
                let context = UIGraphicsGetCurrentContext()
                var rect = usedRect
                rect.origin.x += 4
                rect.size.width -= 8
                rect.origin.y += origin.y
                rect.origin.y += 1
                rect.size.height = 12
                let path = UIBezierPath(rect: rect)
                context?.setFillColor(color.cgColor)
                path.fill()
            }
        }
    }
}

