//
//  PostCell.swift
//  InstProfile
//
//  Created by Владимир Есаян on 20.09.2023.
//

import UIKit

class PostCell: UICollectionViewCell {
    var postImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //добавляю элементы на view
        addSubview(postImageView)
        
        //функции настройки элементов ячейки
        imageViewCongigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configures
    
    //настройка изображения
    func imageViewCongigure() {
        //содержимое контейнера будет отображаться только в пределах его рамок, отсекая все, что находится за его пределами
        postImageView.clipsToBounds = true
        postImageView = UIImageView(frame: contentView.bounds)
        postImageView.contentMode = .scaleAspectFill
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.backgroundColor = .blue
    }
    
    //MARK: - Constraits
    
    func setConstraits() {
        // Настройка ограничений для imageView,
        postImageView.snp.makeConstraints { make in
            // Занимайте все края contentView
            make.edges.equalTo(contentView)
        }
    }
}


