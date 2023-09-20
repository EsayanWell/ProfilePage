//
//  PostCell.swift
//  InstProfile
//
//  Created by Владимир Есаян on 20.09.2023.
//

import UIKit

class PostCell: UICollectionViewCell {
    var imageView: UIImageView!
    var captionLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.width))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)

        captionLabel = UILabel(frame: CGRect(x: 0, y: frame.width, width: frame.width, height: frame.height - frame.width))
        captionLabel.numberOfLines = 0
        contentView.addSubview(captionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
