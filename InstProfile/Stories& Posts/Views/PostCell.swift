//
//  PostCell.swift
//  InstProfile
//
//  Created by Владимир Есаян on 20.09.2023.
//

import UIKit
import SnapKit

class PostCell: UICollectionViewCell {
    // MARK: - Constant
    let postImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(postImageView)
        // MARK: - sets (функции настройки элементов для cell)
        imageViewCongigure()
        setConstraits()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // функция выполняет задачу обновления интерфейсных элементов на экране информацией из объекта Post, переданного в качестве параметра
    func set(postsArray: Post) {
        postImageView.image = postsArray.postImage
    }
    
    // MARK: - configures
    func imageViewCongigure() {
        postImageView.clipsToBounds = true
        postImageView.contentMode = .scaleAspectFill
        postImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Constraits using SnapKit
    func setConstraits() {
        postImageView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
