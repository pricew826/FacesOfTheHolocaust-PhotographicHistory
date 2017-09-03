import UIKit
import AVFoundation


class VideoPlayer4ViewController: UIViewController {
    
    @IBOutlet weak var theButton: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    let avPlayer = AVPlayer()
    var avPlayerLayer: AVPlayerLayer!
    let invisibleButton = UIButton()
    var timeObserver : AnyObject!
    let timeRemainingLabel = UILabel()
    //let seekSlider = UISlider()
    //var playerRateBeforeSeek: Float = 0
    
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        let dateWidth = dateLabel.bounds.size.width
        let screenSize = UIScreen.main.bounds.size.width
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: dateWidth + 20, y: 25))
        path.addLine(to: CGPoint(x: screenSize , y: 25))
        
        let shapeLayer  = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.darkGray.cgColor
        shapeLayer.lineWidth = 2.0
        
        view.layer.addSublayer(shapeLayer)
        
        
        view.backgroundColor = .black
        
        
        
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        
        
        view.addSubview(invisibleButton)
        invisibleButton.addTarget(self, action: #selector(invisibleButtonTapped),
                                  for: .touchUpInside)
        
        
        let url = NSURL(string: "https://firebasestorage.googleapis.com/v0/b/faces-of-the-holocaust.appspot.com/o/dachau.mp4?alt=media&token=ada46b0a-0692-408a-8ba1-86acefccc542")
        let playerItem = AVPlayerItem(url: url as! URL)
        avPlayer.replaceCurrentItem(with: playerItem)
        
        let timeInterval : CMTime = CMTimeMakeWithSeconds(1.0, 10)
        timeObserver = avPlayer.addPeriodicTimeObserver(forInterval: timeInterval, queue: DispatchQueue.main) {
            (elapsedTime: CMTime) -> Void in
            
            //print("elapsedTime now:", CMTimeGetSeconds(elapsedTime))
            self.observeTime(elapsedTime: elapsedTime)
            
            } as AnyObject!
        
        timeRemainingLabel.textColor = .white
        view.addSubview(timeRemainingLabel)
        
        /* view.addSubview(seekSlider)
         seekSlider.addTarget(self, action: #selector(sliderBeganTracking),
         for: .touchDown)
         seekSlider.addTarget(self, action: #selector(sliderEndedTracking), for:
         [.touchUpInside, .touchUpOutside])
         seekSlider.addTarget(self, action: #selector(sliderValueChanged),
         for: .valueChanged)*/
        
        
    }
    
    
    deinit {
        
        avPlayer.removeTimeObserver(timeObserver)
        
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        avPlayer.pause()
        
    }
    
    
    
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        avPlayerLayer.frame = view.bounds
        invisibleButton.frame = view.bounds
        
        let controlsHeight: CGFloat = 30
        let controlsY: CGFloat = view.bounds.size.height - controlsHeight - 140
        timeRemainingLabel.frame = CGRect(x: 5, y: controlsY, width: 60, height: controlsHeight)
        timeRemainingLabel.font = UIFont(name: "Avenir", size: 11.0)
        view.bringSubview(toFront: theButton)
        
        /*seekSlider.frame = CGRect(x: timeRemainingLabel.frame.origin.x + timeRemainingLabel.bounds.size.width, y: controlsY, width: view.bounds.size.width - timeRemainingLabel.bounds.size.width - 5, height: controlsHeight)*/
        
        
    }
    
    /* func sliderBeganTracking(slider: UISlider) {
     playerRateBeforeSeek = avPlayer.rate
     avPlayer.pause()
     
     }
     
     
     func sliderEndedTracking(slider: UISlider) {
     let videoDuration = CMTimeGetSeconds(avPlayer.currentItem!.duration)
     let elapsedTime: Float64 = videoDuration * Float64(seekSlider.value)
     updateTimeLabel(elapsedTime: elapsedTime, duration: videoDuration)
     
     avPlayer.seek(to: CMTimeMakeWithSeconds(elapsedTime, 100)) {
     (completed: Bool) -> Void in
     if self.playerRateBeforeSeek > 0 {
     self.avPlayer.play()
     }
     }
     
     }
     
     
     func sliderValueChanged(slider: UISlider) {
     let videoDuration = CMTimeGetSeconds(avPlayer.currentItem!.duration)
     let elapsedTime: Float64 = videoDuration * Float64(seekSlider.value)
     updateTimeLabel(elapsedTime: elapsedTime, duration: videoDuration)
     
     
     } */
    
    
    
    
    private func updateTimeLabel(elapsedTime elapsedTime: Float64, duration: Float64) {
        
        let timeRemaining: Float64 = CMTimeGetSeconds(avPlayer.currentItem!.duration) - elapsedTime
        timeRemainingLabel.text = String(format: "%02d:%02d", ((lround(timeRemaining) / 60) % 60 ), lround(timeRemaining) % 60)
        
    }
    
    
    private func observeTime(elapsedTime: CMTime) {
        
        let duration = CMTimeGetSeconds(avPlayer.currentItem!.duration)
        if duration > 0 {
            let elapsedTime = CMTimeGetSeconds(elapsedTime)
            updateTimeLabel(elapsedTime: elapsedTime, duration: duration)
        }
        
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
