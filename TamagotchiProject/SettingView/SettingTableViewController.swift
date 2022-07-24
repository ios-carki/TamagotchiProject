//
//  SettingTableViewController.swift
//  TamagotchiProject
//
//  Created by Carki on 2022/07/24.
//

import UIKit


class SettingTableViewController: UITableViewController {
    let backgroundColorSet = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    let fontColorSet = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    
    
    static let identifier = "SettingTableViewController"
    var settingList = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
    var leftIconImage = ["pencil", "moon.fill", "arrow.clockwise"]
    var rightTextLabel: [String?] = [nil, nil, nil]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightTextLabel[0] = UserDefaults.standard.string(forKey: "Name")
        
        view.backgroundColor = backgroundColorSet
        titleSetting()

        
        
    }
    
    func titleSetting() {
        self.title = "설정"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: fontColorSet]
        self.navigationController?.navigationBar.tintColor = fontColorSet
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as! SettingTableViewCell
        
        cell.menuNameLabel.text = settingList[indexPath.row]
        cell.menuNameLabel.textColor = .black
        cell.menuNameLabel.font = .boldSystemFont(ofSize: 15)
        cell.leftImageView.image = UIImage(systemName: leftIconImage[indexPath.row])
        cell.leftImageView.tintColor = fontColorSet
        cell.rightLabel.text = rightTextLabel[indexPath.row]
        cell.rightLabel.font = .systemFont(ofSize: 15)
        cell.rightLabel.textColor = fontColorSet
        cell.rightLabel.textAlignment = .right
        cell.backgroundColor = backgroundColorSet
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row == 1 && indexPath.row == 2 else{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "ChangeNickNameViewController") as! ChangeNickNameViewController
            vc.modalPresentationStyle = .fullScreen
            
            let nav = UINavigationController(rootViewController: vc)
            
            vc.loadText = rightTextLabel[0]!
            self.navigationController?.pushViewController(vc, animated: true)
            
            return
        }
    }

    //셀의 높이(옵션, 빈도 높은) (feat. tableView.rowheight -> 단순높이)
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //if indexPath == [0,0]
        if indexPath.section == 0 && indexPath.row == 0 {
            return 60
        }else {
            return 60
        }

    }
}