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
        
        // добавляю элементы на view
        addSubview(postImageView)
        
        // вызов функций
        imageViewCongigure()
        setConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // функция выполняет задачу обновления интерфейсных элементов на экране информацией из объекта Expense, переданного в качестве параметра
    func set(postsArray: Post) {
        postImageView.image = postsArray.postImage
    }
    
    // MARK: - configures
    
    // настройка изображения
    func imageViewCongigure() {
        // содержимое контейнера будет отображаться только в пределах его рамок, отсекая все, что находится за его пределами
        postImageView.clipsToBounds = true
        postImageView.contentMode = .scaleAspectFill
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.backgroundColor = .white
    }
    
    // MARK: - Constraits
    
    func setConstraits() {
        // Настройка ограничений для imageView,
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: topAnchor),
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            postImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 380),
            postImageView.widthAnchor.constraint(equalToConstant: 380)
        ])
    }
}
