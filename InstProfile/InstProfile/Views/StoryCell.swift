//
//  StoryCell.swift
//  InstProfile
//
//  Created by Владимир Есаян on 20.09.2023.
//

import UIKit

class StoryCell: UICollectionViewCell {
    var storyImageView = UIImageView()
    var storyLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        //добавляю элементы на view
        addSubview(storyImageView)
        addSubview(storyLabel)
        
        //функции настройки элементов ячейки
        configureImageView()
        congigureLabel()

        storyImageView = UIImageView(frame: contentView.bounds)
        storyImageView.contentMode = .scaleAspectFill
        storyImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configures
    
    //настройка изображения
    func configureImageView() {
        //устанавливает радиус скругления углов
        storyImageView.layer.cornerRadius = 30
        //содержимое контейнера будет отображаться только в пределах его рамок, отсекая все, что находится за его пределами
        storyImageView.clipsToBounds = true
        storyImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //настройка текста
    func congigureLabel() {
        //динамическое расширение линий
        storyLabel.numberOfLines = 0
        //цвет текста
        storyLabel.textColor = .white
        //шрифт
        storyLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        //уменьшает размер текста по пространству
        storyLabel.adjustsFontSizeToFitWidth = true
        //отключение автоматических констрейтов
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Constraits
    
    func setConstraits() {
        storyImageView.snp.makeConstraints { maker in
            maker.leading.trailing.top.equalToSuperview()
            maker.width.equalTo(60)
            maker.height.equalTo(60)
        }
    }
}
