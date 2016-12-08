//
//  CategoryCell.swift
//  AppStoreClone
//
//  Created by Joel Sene on 07/12/16.
//  Copyright © 2016 Joel Sene. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        
        let collectionView = UICollectionView(frame:  .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    
    //configuração da celula principal
    func setupViews() {
        backgroundColor = UIColor.black
        
        addSubview(appsCollectionView)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
        

        appsCollectionView.leadingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    //define numero de celulas a serem exibidas
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    //define tamanho das celulas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 115, height: 146)
    }
    //define as margens das celulas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(15, 25, 40, 25)
    }
    
}
//conrfigura as celulas
class AppCell: UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //adiciona imageView dentro da celular
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "user_edit")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    //adiciona texto na celula
    /*let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Dados \n" + "Cadastrais"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()*/
    
    let nameTextField : UITextView = {
        let textField = UITextView()
        textField.text = "Dados \n" + "Cadastrais"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textAlignment = .center
        return textField
    }()
    
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(imageView)
        addSubview(nameTextField)
        
        
        imageView.frame = CGRect(x: 12.5, y: 7.5, width: 90, height: 90)
        nameTextField.frame = CGRect(x: 0, y: frame.width - 17.5, width: frame.width, height: 40)
    }
}
