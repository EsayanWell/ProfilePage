//
//  StoryCell.swift
//  InstProfile
//
//  Created by Владимир Есаян on 20.09.2023.
//

import UIKit


class StoryCell: UICollectionViewCell {
    var storyImageView = UIImageView()
    let storyLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // добавляю элементы на view
        addSubview(storyImageView)
        addSubview(storyLabel)
        
        // вызов функций
        setConstraits()
        configureImageView()
        congigureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // функция выполняет задачу обновления интерфейсных элементов на экране информацией из объекта Expense, переданного в качестве параметра
    func set(storiesArray: Story) {
        storyImageView.image = storiesArray.storyImage
        storyLabel.text      = storiesArray.storyText
    }
    
    // MARK: - configures
    
    // настройка изображения
    func configureImageView() {
        // устанавливает радиус скругления углов
        storyImageView.layer.cornerRadius = 30
        // содержимое контейнера будет отображаться только в пределах его рамок, отсекая все, что находится за его пределами
        storyImageView.clipsToBounds = true
        storyImageView.contentMode = .scaleAspectFill
        storyImageView.translatesAutoresizingMaskIntoConstraints = false
        storyImageView.backgroundColor = .purple
    }
    
    // настройка текста
    func congigureLabel() {
        // динамическое расширение линий
        storyLabel.numberOfLines = 0
        // цвет текста
        storyLabel.textColor = .white
        // шрифт
        storyLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        // уменьшает размер текста по пространству
        storyLabel.adjustsFontSizeToFitWidth = true
        // отключение автоматических констрейтов
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Constraits
    
    func setConstraits() {
        // Настройка constraints для imageView
        NSLayoutConstraint.activate([
            storyImageView.topAnchor.constraint(equalTo: topAnchor),
            storyImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            storyImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            storyImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            storyImageView.heightAnchor.constraint(equalToConstant: 60),
            storyImageView.widthAnchor.constraint(equalToConstant: 60),
            
           
            storyLabel.bottomAnchor.constraint(equalTo: storyImageView.bottomAnchor, constant: 20),
            storyLabel.centerXAnchor.constraint(equalTo: storyImageView.centerXAnchor)
        ])
    }
}

