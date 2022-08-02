//
//  EntryCollectionViewController.swift
//  TamagotchiProject
//
//  Created by Carki on 2022/07/22.
//
/*
 07.22 ~ 07.25
 아쉬운점  1. if문 guard or if let 으로 수정할 수 있었으면 코드가 더 간결했을 것이다.
        2. 사용된 텍스트 필드를 밑줄로 된 텍스트필드로 고치지 못한 점.
        3. 기기 초기화에 대한 이해 부족.
        4. 팀별 회의때 다양한 옵션 추가가 나왔는데 그 기능들을 구현하지 못한 점.
 */

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
        
        //셀 간격 설정
        layout.itemSize = CGSize(width: (width / 3), height: (width / 3) * 1.5)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
        //기기 초기화시 userDefault값 초기화
        if UserDefaults.standard.string(forKey: "Level") == nil {
            UserDefaults.standard.set(1, forKey: "Level")
            UserDefaults.standard.set(0, forKey: "Water")
            UserDefaults.standard.set(0, forKey: "Rice")
            UserDefaults.standard.set("대장", forKey: "Name")
        }
        
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

