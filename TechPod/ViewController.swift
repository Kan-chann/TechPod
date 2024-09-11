//
//  ViewController.swift
//  TechPod
//
//  Created by Kanno Taichi on 2024/08/31.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ID付きのセルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //
        var content = cell.defaultContentConfiguration()
        content.text = songNameArray[indexPath.row]
        //セル附属のimageViewに画像を追加
        content.image = UIImage(named: imageNameArray[indexPath.row])
        //画像の大きさを調整
        content.imageProperties.reservedLayoutSize = CGSize(width: 30, height: 30)
        
        cell.contentConfiguration = content
        return cell
        
    }
    
    @IBOutlet var table: UITableView!
    
    var songNameArray = [String]()
    var fileNameArray = [String]()
    var imageNameArray  = [String]()
    var audioPlayer: AVAudioPlayer!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        songNameArray = ["カノン", "エリーゼのために","G線上のエリア"]
        fileNameArray = ["cannon","elise","aria"]
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
        // Do any additional setup after loading the view.
    }
    //セルが押された時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選択されました！")
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //再生準備と再生
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        audioPlayer.play()
    }
    


}

