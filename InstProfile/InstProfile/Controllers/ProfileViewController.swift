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
    //cоздаем UICollectionView
    var instCollectionView: UICollectionView = {
        let instLayout = UICollectionViewFlowLayout()
        let instCollectionView = UICollectionView(frame: .zero, collectionViewLayout: instLayout)
        instCollectionView.backgroundColor = .white
        return instCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: настройка UICollectionView
        //подписка на протоколы
        instCollectionView.delegate = self
        instCollectionView.dataSource = self
        //Эта строка регистрирует класс VerticalCell для использования в коллекции с определенным идентификатором "VerticalCell"
        instCollectionView.register(PostCell.self, forCellWithReuseIdentifier: "PostCell")
        instCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCell")
        view.addSubview(instCollectionView)
        
        instCollectionView.translatesAutoresizingMaskIntoConstraints = false
        instCollectionView.snp.makeConstraints { maker in
            maker.left.right.top.bottom.equalToSuperview()
        }
        
        
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
