//
//  HeroHeaderUIView.swift
//  CamMovie
//
//  Created by David on 12/8/24.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let downloadButton: UIButton = {
        
        let button  = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
        
    }()
    
    private let playButton: UIButton =  {
        
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
        
    }()
    
    private let heroImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode  = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
        
    }()
    
    private func addGradient(){
        let gradientLayor = CAGradientLayer()
        gradientLayor.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayor.frame = bounds
        layer.addSublayer(gradientLayor)
    }
    
    override init (frame: CGRect){
        
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyContraints()
        
    }
    
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame =  bounds
    }
    
    
    private func applyContraints() {
        let playButtonContraint = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let downloadButtonContraint = [
            downloadButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor,constant: 10),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            downloadButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(playButtonContraint)
        NSLayoutConstraint.activate(downloadButtonContraint)
    }
}
