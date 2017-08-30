import UIKit
import AVFoundation

class VideoPlayer2ViewController: UIViewController {
    
    
    @IBOutlet weak var theButton: UIButton!
    
    
    let avPlayer = AVPlayer()
    var avPlayerLayer: AVPlayerLayer!
    let invisibleButton = UIButton()
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        view.backgroundColor = .black
        
        
        
        
        
        
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        
        
        view.addSubview(invisibleButton)
        invisibleButton.addTarget(self, action: #selector(invisibleButtonTapped),
                                  for: .touchUpInside)
        
        
        let url = NSURL(string: "https://firebasestorage.googleapis.com/v0/b/faces-of-the-holocaust.appspot.com/o/hol.mp4.mov?alt=media&token=baf9bdb3-d3eb-4f0f-adfb-c3dc67d10744")
        let playerItem = AVPlayerItem(url: url as! URL)
        avPlayer.replaceCurrentItem(with: playerItem)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        super.viewWillAppear(animated)
        count += 1
        
        if count <= 1 {
            avPlayer.play()
        } else {
            avPlayer.pause()
        }
        
        
    }
    
    
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        avPlayerLayer.frame = view.bounds
        invisibleButton.frame = view.bounds
        
        view.bringSubview(toFront: theButton)
        
    }
    
    
    var count = 0
    
    
    func invisibleButtonTapped(sender: UIButton) {
        let playerIsPlaying = avPlayer.rate > 0
        if playerIsPlaying {
            avPlayer.pause()
        } else {
            avPlayer.play()
        }
    }
    
    
    
    
    
    
}
