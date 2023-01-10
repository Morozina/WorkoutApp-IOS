//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 09/01/2023.
//

import UIKit

enum TypeButton {
    case primary
    case secondary
}

final class WAButton: UIButton {
    
    private var type: TypeButton = .primary
    private let label = UILabel()
    private let icon = UIImageView()
    
    init(type: TypeButton) {
        super.init(frame: .zero)
        
        self.type = type
        
        addView()
        addLayout()
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ String: String?) {
        label.text = String
    }
}

private extension WAButton {
  
    private func addView() {
        addNewView(label)
        addNewView(icon)
    }
    
    private func addLayout() {
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
    
    private func config() {
        
        switch type {
        case .primary:
            backgroundColor = .clear
    
            label.textColor = Resources.Colors.TabBar.inActive
            icon.tintColor = Resources.Colors.TabBar.inActive
        case .secondary:
            backgroundColor = Resources.Colors.Common.customButtonBackground
            layer.cornerRadius = 14
            
            label.textColor = Resources.Colors.TabBar.active
            label.textAlignment = .center
            
            icon.image = Resources.Image.Common.down_arrow?.withRenderingMode(.alwaysTemplate)
            icon.tintColor = Resources.Colors.TabBar.active
        }
        layer.cornerRadius = 14
        label.font = Resources.Fonts.NavBar.HelveticaRegular(size: 15)
        label.textAlignment = .center
        icon.image = Resources.Image.Common.down_arrow?.withRenderingMode(.alwaysTemplate)

    }
}
