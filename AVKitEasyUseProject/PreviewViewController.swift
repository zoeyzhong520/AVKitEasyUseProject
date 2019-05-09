//
//  PreviewViewController.swift
//  AVKitEasyUseProject
//
//  Created by zhifu360 on 2019/5/9.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit
import AVKit

class PreviewViewController: BaseViewController {

    lazy var previewView: PreviewView = {
        let previewView = PreviewView(frame: CGRect(x: 0, y: 0, width: ScreenSize.width, height: ContentHeight))
        previewView.delegate = self
        return previewView
    }()
    
    let avPlayerViewController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPage()
    }
    
    func setPage() {
        title = "演示"
        view.addSubview(previewView)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PreviewViewController: PreviewViewDelegate {
    
    func play() {
        let musicUrl = "http://sc1.111ttt.cn/2018/1/03/13/396131229550.mp3"
        let playerItem = AVPlayerItem(url: URL(string: musicUrl)!)
        let player = AVPlayer(playerItem: playerItem)
        avPlayerViewController.player = player
        present(avPlayerViewController, animated: true) {
            self.avPlayerViewController.player?.play()
        }
    }
    
}
