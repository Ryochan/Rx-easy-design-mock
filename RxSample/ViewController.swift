//
//  ViewController.swift
//  RxSample
//
//  Created by 福田涼介 on 4/10/16.
//  Copyright © 2016 yuzushio. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct Timeline {
    let name: String
    let profileImage: UIImage
    let bodyContent: String
}

class ViewController: UITableViewController {
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let elements = Driver.just([
            Timeline(name: "yuzushioh", profileImage: UIImage(named: "IMG_2231")!, bodyContent: "バイトするよりアッテの時代！https://t.co/Uk3lUQOu6W "),
            Timeline(name: "yuzushioh", profileImage: UIImage(named: "IMG_2231")!, bodyContent: "RxSwift/RxCocoa Driver Unitについてまとめてみた。 by @yuzushioh on @Qiita http://qiita.com/yuzushioh/items/0a4483502c5c8569790a …"),
            Timeline(name: "yuzushioh", profileImage: UIImage(named: "IMG_2231")!, bodyContent: "I just backed Dock for your Apple device, Pebble Watch and USB-C device. on @Kickstarter https://www.kickstarter.com/projects/dodock/new-design-dock-for-all-apple-productincluding-usb …"),
            Timeline(name: "yuzushioh", profileImage: UIImage(named: "IMG_2231")!, bodyContent: "アッテで六本木のゲストルームかします！ってのがある！！これで終電逃しても大丈夫だ"),
            Timeline(name: "yuzushioh", profileImage: UIImage(named: "IMG_2231")!, bodyContent: "電車の中で「ギャハハハｗｗｗ」って笑ってる女子高生たちにおっさんが「電車内だぞ静かにしろ！」って言って、静かにしようとしながらもまだ声を出さずに肩を震わせながら笑ってるのを見たおっさんが「マナーモードかよ！」ってツッコんだ瞬間、電車内の7割くらいの人が腹抱えて死んだ。"),
            Timeline(name: "yuzushioh", profileImage: UIImage(named: "IMG_2231")!, bodyContent: "今日1日で二回ラインを退会させられてるんだがこれはバクとして報告したほうがいいのかな、、"),
            Timeline(name: "yuzushioh", profileImage: UIImage(named: "IMG_2231")!, bodyContent: "入社したときはguard elseとif letの違いもあんまりわかってなかったな〜"),
        ])
        
        elements.asDriver()
            .drive(tableView.rx_itemsWithCellIdentifier("Cell", cellType: TableViewCell.self)) { _, timeline, cell in
                cell.timeline = timeline
            }
            .addDisposableTo(disposeBag)
        
        setupNav()
    }
    
    private func setupNav() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
        navigationController?.navigationBar.barStyle = .Black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

