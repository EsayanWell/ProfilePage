//
//  StoryCell.swift
//  InstProfile
//
//  Created by Владимир Есаян on 20.09.2023.
//

import UIKit
import SnapKit

class StoryCell: UICollectionViewCell {
    
    // MARK: - constants
    let storyImageView = UIImageView()
    let storyLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(storyImageView)
        addSubview(storyLabel)
        // MARK: - sets (функции настройки элементов для cell)
        configureImageView()
        congigureLabel()
        setConstraits()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // функция выполняет задачу обновления интерфейсных элементов на экране информацией из объекта Story, переданного в качестве параметра
    func set(storiesArray: Story) {
        storyImageView.image = storiesArray.storyImage
        storyLabel.text      = storiesArray.storyText
    }
    
    // MARK: - configures
    // настройка изображения
    func configureImageView() {
        storyImageView.layer.cornerRadius = 30
        storyImageView.clipsToBounds = true
        storyImageView.contentMode = .scaleAspectFill
    }
    
    // настройка текста
    func congigureLabel() {
        storyLabel.textColor = .white
    }
    
    // MARK: - Constraits using SnapKit
    func setConstraits() {
        storyImageView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.width.equalTo(60)
        }
        storyLabel.snp.makeConstraints { make in
            make.top.equalTo(storyImageView.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.centerX.equalTo(storyImageView.snp.centerX)
        }
    }
}
