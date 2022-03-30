//
//  View.swift
//  TestTask
//
//  Created by Михаил on 29.03.2022.
//

import UIKit
import TagListView
import SnapKit

class DrinkListView: BaseView {
    
    let scrollView = UIScrollView()
    
    let tagListView: TagListView = {
        let tagListView = TagListView()
        tagListView.textFont = .systemFont(ofSize: 15)
        tagListView.cornerRadius = 6
        tagListView.tagBackgroundColor = .gray
        tagListView.marginY = 8
        tagListView.marginX = 8
        tagListView.paddingY = 5
        tagListView.paddingX = 10
        return tagListView
    }()
    
    override func setupViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(tagListView)
    }
    
    override func didSetupView() {
        backgroundColor = .white
    }
    override func setupConstraints() {
        scrollView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        tagListView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(scrollView)
        }
        
    }
    
}
