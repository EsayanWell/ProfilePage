//
//  ViewController.swift
//  InstProfile
//
//  Created by Владимир Есаян on 18.09.2023.
//
import SnapKit
import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //название
        title = "elonmuskrus"
        view.backgroundColor = .black
        //цвет текста
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
     
    }


}

