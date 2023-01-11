//
//  baseInfoView.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 10/01/2023.
//

import UIKit

class BaseInfoView: BaseView {
    
    private let titleLabel = UILabel()
    private let moreButton = WAButton(type: .primary)
    private let contentView = UIView()
    
    init(title: String? = nil, buttonTitle: String? = nil) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        
        moreButton.setTitle(buttonTitle)
        moreButton.isHidden = buttonTitle == nil ? true : false
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtonTarget(target: Any?, selector: Selector) {
        moreButton.addTarget(target, action: selector, for: .touchUpInside)
    }
}

extension BaseInfoView {
    
    override func setUpViews() {
        super.setUpViews()
        
        addNewView(titleLabel)
        addNewView(moreButton)
        addNewView(contentView)
    }
    
    override func setUpLayouts() {
        super.setUpLayouts()
        
        let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        let contentTopOffset: CGFloat = titleLabel.text == nil ? 0 : 10
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),

            moreButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            moreButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            moreButton.heightAnchor.constraint(equalToConstant: 28),
            
            contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentTopOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func config() {
        super.config()
        self.backgroundColor = .clear
        
        titleLabel.textColor = Resources.Colors.TabBar.inActive
        titleLabel.font = Resources.Fonts.NavBar.HelveticaRegular(size: 13)
        
        contentView.backgroundColor = .white
        contentView.layer.borderColor = Resources.Colors.TabBar.separator.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 5
        
        moreButton.makeSystem(moreButton)
        moreButton.setTitleColor(Resources.Colors.TabBar.inActive, for: .normal)
    }
}
