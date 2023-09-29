//
//  ViewController.swift
//  InstProfile
//
//  Created by Владимир Есаян on 18.09.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - constants
    // массив историй
    private var storiesArray: [Story] = []
    private var postsArray: [Post] = []
    // создание экземпляра UICollectionView
    private var instCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "elonmuskrus"
        // вызов функции
        setupInstCollectionView()
        // добавление данных в массивы
        storiesArray = fetchStoryData()
        postsArray = fetchPostData()
    }
    
    // MARK: настройка UICollectionView
    private func setupInstCollectionView() {
        // Создается экземпляр UICollectionView с начальным фреймом нулевого размера и устанавливается на него макет (makeLayout) из функции
        instCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())
        instCollectionView.translatesAutoresizingMaskIntoConstraints = false
        // отключение индикаторов при перемещении
        instCollectionView.showsVerticalScrollIndicator = false
        instCollectionView.showsHorizontalScrollIndicator = false
        // подписка на протоколы
        instCollectionView.delegate = self
        instCollectionView.dataSource = self
        // регистрация
        instCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCell")
        instCollectionView.register(PostCell.self, forCellWithReuseIdentifier: "PostCell")
        view.addSubview(instCollectionView)
        // настройка constraits с помощью SnapKit
        instCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: Layout configure
    private func makeLayout() -> UICollectionViewCompositionalLayout {
        // создается экземпляр UICollectionViewCompositionalLayout с использованием замыкания (closure) в качестве параметра. Замыкание принимает два аргумента: sectionIndex (индекс секции) и _ (просто пустой параметр, так как он не используется внутри замыкания
        // [unowned self] указывает на то, что внутри замыкания будет использоваться слабая ссылка на объект, который вызвал этот замыкание. Это предотвращает возможные утечки памяти, когда объект, который вызвал замыкание, больше не существует в памяти.
        let layout = UICollectionViewCompositionalLayout { [unowned self] sectionIndex, _ in
            // используется оператор switch для определения макета каждой секции на основе ее sectionIndex. Если sectionIndex равен 0, вызывается функция makeStoriesSection(), вероятно, для создания макета секции "Stories". Если sectionIndex равен 1, вызывается функция makePostsSection(), предположительно, для создания макета секции "Posts"
            switch sectionIndex {
            case 0: return makeStoriesSection()
            case 1: return makePostsSection()
            default: return nil
            }
        }
        return layout
    }
    
    // настройка макета(layout) историй
    private func makeStoriesSection() -> NSCollectionLayoutSection {
        // Создается объект NSCollectionLayoutItem, который представляет элемент (ячейку) в коллекции. Этот элемент занимает 100% ширины и 100% высоты раздела, что делает его заполняющим всю доступную область.
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        ))
        // Создается группа элементов NSCollectionLayoutGroup, которая располагает элементы горизонтально. Эта группа имеет фиксированные размеры: ширина 60 и высота 90. Внутри этой группы находится только один элемент, определенный ранее.
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(60), heightDimension: .absolute(90)), subitems: [item])
        // Создается раздел NSCollectionLayoutSection с группой элементов, определенной в предыдущем шаге. Этот раздел будет содержать элементы (ячейки) в коллекции.
        let section = NSCollectionLayoutSection(group: group)
        // Устанавливается интервал между группами элементов в разделе, равный 30 пунктам. Это определяет расстояние между "сторис" или карточками с историями в этом разделе.
        section.interGroupSpacing = 30
        // Устанавливается поведение прокрутки раздела. .continuous означает, что раздел будет прокручиваться плавно, без остановок между группами элементов.
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    // настройка макета(layout) постов
    private func makePostsSection() -> NSCollectionLayoutSection {
        // создается объект NSCollectionLayoutItem с размерами: ширина составляет одну треть контейнера (.fractionalWidth(1/3)), а высота занимает всю высоту контейнера (.fractionalHeight(1)). Это представляет собой размер каждого элемента (поста) в секции.
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalHeight(1)
        ))
        // Свойство contentInsets устанавливается для обеспечения внутренних отступов вокруг каждого элемента. В данном случае каждый элемент будет иметь отступы по 10 пунктов сверху, слева, снизу и справа.
        item.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        // Создается горизонтальная группа (NSCollectionLayoutGroup), которая содержит один элемент (как определено выше). Ширина этой группы равна полной ширине контейнера (fractionalWidth: 1), а высота устанавливается в абсолютное значение 230 пунктов.
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(230)), subitems: [item])
        // Затем создается объект NSCollectionLayoutSection, используя ранее определенную группу. Эта секция будет содержать настроенную группу элементов.
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}

// MARK: - UICollectionViewDataSourse
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // кол-во секций (одна для историй, другая для постов)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // используется для определения количества элементов (ячеек) в указанной секции коллекции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return storiesArray.count
        } else {
            return postsArray.count
        }
    }
    
    // настройка ячеек
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
            let stories = storiesArray[indexPath.row]
            cell.set(storiesArray: stories)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
            let posts = postsArray[indexPath.row]
            cell.set(postsArray: posts)
            return cell
        }
    }
}

// MARK: - fetchData
extension ProfileViewController {
    
    // данные для массива Story
    func fetchStoryData() -> [Story] {
        let story1 = Story(storyImage: storyImages.story1, storyText: "UFO")
        let story2 = Story(storyImage: storyImages.story2, storyText: "Starship")
        let story3 = Story(storyImage: storyImages.story3, storyText: "Mars")
        let story4 = Story(storyImage: storyImages.story4, storyText: "Rover")
        let story5 = Story(storyImage: storyImages.story5, storyText: "Telescope")
        let story6 = Story(storyImage: storyImages.story6, storyText: "Starlink")
        
        return [story1, story2, story3, story4, story5, story6]
    }
    
    // данные для массива Post
    func fetchPostData() -> [Post] {
        let post1  = Post(postImage: postImages.post1)
        let post2  = Post(postImage: postImages.post2)
        let post3  = Post(postImage: postImages.post3)
        let post4  = Post(postImage: postImages.post4)
        let post5  = Post(postImage: postImages.post5)
        let post6  = Post(postImage: postImages.post6)
        let post7  = Post(postImage: postImages.post7)
        let post8  = Post(postImage: postImages.post8)
        let post9  = Post(postImage: postImages.post9)
        let post10 = Post(postImage: postImages.post10)
        let post11 = Post(postImage: postImages.post11)
        let post12 = Post(postImage: postImages.post12)
        
        return [post1, post2, post3, post4, post5, post6, post7, post8, post9, post10, post11, post12]
    }
}
