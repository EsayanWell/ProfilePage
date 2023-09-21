//
//  ViewController.swift
//  InstProfile
//
//  Created by Владимир Есаян on 18.09.2023.
//
import SnapKit
import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: constants and vars
    //массив историй
    var storiesArray: [Story] = []
    var postsArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .black
        title = "elonmuskrus"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        storiesArray = fetchData()
        //загрузка данных историй и постов в массивы
        loadPosts()
        
        //MARK: настройка UICollectionView
        //cоздаем UICollectionView
        //var instCollectionView = UICollectionView()
        //представляет собой стандартный макет (layout) для UICollectionView
        let instLayout = UICollectionViewFlowLayout()
        //коллекция будет занимать всю доступную область текущего представления
        let instCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: instLayout)
        instCollectionView.backgroundColor = .white
        //подписка на протоколы
        instCollectionView.delegate = self
        instCollectionView.dataSource = self
        //Эта строка регистрирует класс VerticalCell для использования в коллекции с определенным идентификатором "VerticalCell"
        instCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCell")
        instCollectionView.register(PostCell.self, forCellWithReuseIdentifier: "PostCell")
        instCollectionView.backgroundColor = .white
        view.addSubview(instCollectionView)
        
        //настройка conttrsits
        instCollectionView.snp.makeConstraints { maker in
            maker.left.right.top.bottom.equalToSuperview()
        }
        
        //функция загрузки фото постов в массив
        func loadPosts() {
            postsArray.append(UIImage(named: "1")!)
            postsArray.append(UIImage(named: "2")!)
            postsArray.append(UIImage(named: "3")!)
            postsArray.append(UIImage(named: "4")!)
            postsArray.append(UIImage(named: "5")!)
            postsArray.append(UIImage(named: "6")!)
            postsArray.append(UIImage(named: "7")!)
            postsArray.append(UIImage(named: "8")!)
            postsArray.append(UIImage(named: "9")!)
            postsArray.append(UIImage(named: "10")!)
            postsArray.append(UIImage(named: "11")!)
            postsArray.append(UIImage(named: "12")!)
        }
        
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //кол-во секций (одна для историй, другая для постов)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //используется для определения количества элементов (ячеек) в указанной секции коллекции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return storiesArray.count
        } else {
            return postsArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
            let story = storiesArray[indexPath.row]
            cell.set(story: story)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
            let post = postsArray[indexPath.row]
            return cell
        }
    }
    
    // UICollectionViewDelegateFlowLayout методы
    //вы настраиваете размеры ячеек (cell size) для элементов коллекции (UICollectionView) в зависимости от их секции (section) и индекса внутри секции (indexPath).
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if indexPath.section == 0 {
                return CGSize(width: 100, height: 100)
            } else {
                return CGSize(width: collectionView.frame.width, height: 300)
            }
        }
}
extension ProfileViewController {
        
        func fetchData() -> [Story] {
            let story1 = Story(storyImage: storyImages.ufo, storyText: "UFO")
            let story2 = Story(storyImage: storyImages.starship, storyText: "Starship")
            let story3 = Story(storyImage: storyImages.mars, storyText: "Mars")
            let story4 = Story(storyImage: storyImages.spaceRover, storyText: "Space Rover")
            let story5 = Story(storyImage: storyImages.telescope, storyText: "Telescope")
            let story6 = Story(storyImage: storyImages.starlink, storyText: "Starlink")
            
            return [story1, story2, story3, story4, story5, story6]
        }
    }
