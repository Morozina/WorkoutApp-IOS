//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 09/01/2023.
//

import UIKit

final class SecondaryButton: UIButton {
    
    private let label = UILabel()
    private let icon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addView()
        addLayout()
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ String: String) {
        label.text = String
    }
}

private extension SecondaryButton {
  
    func addView() {
        addSubview(label)
        addSubview(icon)
    }
    
    func addLayout() {
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            icon.heightAnchor.constraint(equalToConstant: 5),
            icon.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: icon.leadingAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    func config() {
        backgroundColor = Resources.Colors.Common.customButtonBackground
        layer.cornerRadius = 14
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Resources.Colors.TabBar.active
        label.textAlignment = .center
        label.font = Resources.Fonts.NavBar.HelveticaRegular(size: 15)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = Resources.Image.Common.down_arrow?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = Resources.Colors.TabBar.active
    }
}
