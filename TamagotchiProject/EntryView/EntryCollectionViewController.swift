//
//  EntryCollectionViewController.swift
//  TamagotchiProject
//
//  Created by Carki on 2022/07/22.
//

import UIKit


class EntryCollectionViewController: UICollectionViewController {
    
    var tamagochiList = tamagochiDetail()
    let backgroundColorSet = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = backgroundColorSet
        navigationItem.title = "다마고치 선택하기"
        
        //컬렉션뷰의 셀 크기, 셀 간격 등 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 29 //간격
        let width = UIScreen.main.bounds.width - (spacing * 4) //셀 간격개수(셀이 3개라 간격은 4개)
        
        layout.itemSize = CGSize(width: (width / 3), height: (width / 3) * 1.5)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagochiList.tamagochi.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EntryCollectionViewCell", for: indexPath) as! EntryCollectionViewCell

        cell.backgroundColor = backgroundColorSet
        
        let data = tamagochiList.tamagochi[indexPath.row]
        cell.configureCell(data: data)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = tamagochiList.tamagochi[indexPath.row]
        
        
        if indexPath.row > 2 {
            let alert1 = UIAlertController(title: "이 다마고치는 자는중이에요.", message: "추후 업데이트 예정입니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction1 = UIAlertAction(title: "돌아가기", style: .default) { (action) in}
            alert1.addAction(okAction1)
            
            present(alert1, animated: false, completion: nil)
        } else {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            vc.imageRepo = data.image
            vc.lableRepo = data.name
            vc.introduceRepo = data.introduce
            
            present(vc, animated: true, completion: nil)
            
          
            
        }
        
        
    }
}
