//
//  ViewController.swift
//  MonsterDoll
//
//  Created by Hsiao-Han Chi on 2022/5/6.
//

import UIKit

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //此 function 將在 ScrollView 滑動停止時呼叫
        
        //pageChange是我的ScrollView的名稱，contentOffset.x是目前滑動的水平距離，bounds.width是ScrollView設定的寬度，所以兩者相除會得到滑動的距離應該是ScrollView的第幾頁，對應到pageControl的第幾個圓點
        let pageNum = pageChange.contentOffset.x / pageChange.bounds.width
        pageControl.currentPage = Int(pageNum)
    }
    
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var bodyColorView: UIView!
    @IBOutlet weak var bodyImageView: UIImageView!
    @IBOutlet weak var eyesImageView: UIImageView!
    @IBOutlet weak var mouthImageView: UIImageView!
    @IBOutlet weak var armsImageView: UIImageView!
    @IBOutlet weak var legsImageView: UIImageView!
    @IBOutlet weak var accImageView: UIImageView!
    
    @IBOutlet weak var bodyButton: UIButton!{
        didSet{
            bodyButton.configurationUpdateHandler = {
                bodyButton in bodyButton.alpha = bodyButton.isSelected ? 1 : 0.3
                // 1 : 0.3，代表按鈕在 isSelected 狀態時的透明度是1，normol 狀態時透明度是 0.3
            }
        }
    }
    
    @IBOutlet weak var eyesButton: UIButton!{
        didSet{
            eyesButton.configurationUpdateHandler = {
                eyesButton in eyesButton.alpha = eyesButton.isSelected ? 1 : 0.3
            }
        }
    }
    
    @IBOutlet weak var mouthButton: UIButton!{
        didSet{
            mouthButton.configurationUpdateHandler = {
                mouthButton in mouthButton.alpha = mouthButton.isSelected ? 1 : 0.3
            }
        }
    }
    
    @IBOutlet weak var armsButton: UIButton!{
        didSet{
            armsButton.configurationUpdateHandler = {
                armsButton in armsButton.alpha = armsButton.isSelected ? 1 : 0.3
            }
        }
    }
    
    @IBOutlet weak var legsButton: UIButton!{
        didSet{
            legsButton.configurationUpdateHandler = {
                legsButton in legsButton.alpha = legsButton.isSelected ? 1 : 0.3
            }
        }
    }
    
    @IBOutlet weak var accButton: UIButton!{
        didSet{
            accButton.configurationUpdateHandler = {
                accButton in accButton.alpha = accButton.isSelected ? 1 : 0.3
            }
        }
    }
    
    
    @IBOutlet var bodyPartsChoiceButton: [UIButton]!
    
    @IBOutlet weak var dicesButton: UIButton!{
        didSet{
            dicesButton.configurationUpdateHandler = {
                dicesButton in dicesButton.alpha = dicesButton.isHighlighted ? 0.5 : 1
            }
        }
    }
    
    @IBOutlet weak var paletteButton: UIButton!{
        didSet{
            paletteButton.configurationUpdateHandler = {
                paletteButton in paletteButton.alpha = paletteButton.isHighlighted ? 0.5 : 1
            }
        }
    }
    
    @IBOutlet weak var colorView: UIView!
    
    
    @IBOutlet weak var pageChange: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var randomColorButton: UIButton!
    
    
    
    func initialUI(){
        //自訂一組預設的組合
        bodyColorView.layer.backgroundColor = UIColor.systemTeal.cgColor
        bodyImageView.image = UIImage(named: "body-6")
        eyesImageView.image = UIImage(named: "eyes-3")
        mouthImageView.image = UIImage(named: "mouth-4")
        armsImageView.image = UIImage(named: "arms-9")
        legsImageView.image = UIImage(named: "legs-7")
        accImageView.image = UIImage(named: "acc-1")
        
        //預設顯示正在選擇body樣式
        bodyButton.isSelected = true
        
        //顯示body選項
        for i in 0...8{
            bodyPartsChoiceButton[i].configuration?.image = UIImage(named: "bodyIcon-"+"\(i+1)")
        }
        
        //身體可以更換顏色，所以預設顯示調色盤
        paletteButton.isHidden = false
        
        //沒有點選調色盤前隱藏colorView
        colorView.isHidden = true
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initialUI()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func chooseBodyParts(_ sender: UIButton){
        switch sender{
        case bodyButton:
            //設定身體部位按鈕的狀態，選到的變成 isSelected
            bodyButton.isSelected = true
            eyesButton.isSelected = false
            mouthButton.isSelected = false
            armsButton.isSelected = false
            legsButton.isSelected = false
            accButton.isSelected = false
            
            //用for迴圈將身形的所有圖片依序設為button顯示的圖片，一共有9張，所以i的範圍是0~8；Asset中的圖片因為我給的編號是1~9，所以呼叫時要用i+1才對得上
            for i in 0...8{
                bodyPartsChoiceButton[i].configuration?.image = UIImage(named: "bodyIcon-\(i+1)")
            }
            
            //身形跟眼睛是必選項目，所以隱藏最後一個的不選擇按鈕
            bodyPartsChoiceButton[9].configuration?.image = nil
            //身體可以更換顏色，所以顯示調色盤，在未點選調色盤時隱藏調色畫面
            paletteButton.isHidden = false
            colorView.isHidden = true
            
        case eyesButton:
            bodyButton.isSelected = false
            eyesButton.isSelected = true
            mouthButton.isSelected = false
            armsButton.isSelected = false
            legsButton.isSelected = false
            accButton.isSelected = false
            
            for i in 0...8{
                bodyPartsChoiceButton[i].configuration?.image = UIImage(named: "eyesIcon-\(i+1)")
            }
            
            bodyPartsChoiceButton[9].configuration?.image = nil
            
            paletteButton.isHidden = true
            colorView.isHidden = true
            
        case mouthButton:
            bodyButton.isSelected = false
            eyesButton.isSelected = false
            mouthButton.isSelected = true
            armsButton.isSelected = false
            legsButton.isSelected = false
            accButton.isSelected = false
            
            for i in 0...8{
                bodyPartsChoiceButton[i].configuration?.image = UIImage(named: "mouthIcon-\(i+1)")
            }
            
            bodyPartsChoiceButton[9].configuration?.image = UIImage(named: "null")
            
            paletteButton.isHidden = true
            colorView.isHidden = true
            
        case armsButton:
            bodyButton.isSelected = false
            eyesButton.isSelected = false
            mouthButton.isSelected = false
            armsButton.isSelected = true
            legsButton.isSelected = false
            accButton.isSelected = false
            
            for i in 0...8{
                bodyPartsChoiceButton[i].configuration?.image = UIImage(named: "armsIcon-\(i+1)")
            }
            
            bodyPartsChoiceButton[9].configuration?.image = UIImage(named: "null")
            
            paletteButton.isHidden = true
            colorView.isHidden = true
            
        case legsButton:
            bodyButton.isSelected = false
            eyesButton.isSelected = false
            mouthButton.isSelected = false
            armsButton.isSelected = false
            legsButton.isSelected = true
            accButton.isSelected = false
            
            for i in 0...8{
                bodyPartsChoiceButton[i].configuration?.image = UIImage(named: "legsIcon-\(i+1)")
            }
            
            bodyPartsChoiceButton[9].configuration?.image = UIImage(named: "null")
            
            paletteButton.isHidden = true
            colorView.isHidden = true
            
        case accButton:
            bodyButton.isSelected = false
            eyesButton.isSelected = false
            mouthButton.isSelected = false
            armsButton.isSelected = false
            legsButton.isSelected = false
            accButton.isSelected = true
            
            for i in 0...8{
                bodyPartsChoiceButton[i].configuration?.image = UIImage(named: "accIcon-\(i+1)")
            }
            
            bodyPartsChoiceButton[9].configuration?.image = UIImage(named: "null")
            
            paletteButton.isHidden = true
            colorView.isHidden = true
            
        default:
            print("You didn't choose anything")
        }
        
    }
    
    
    @IBAction func chooseBodyPartsOptions(_ sender: UIButton){
        
        if bodyButton.isSelected == true{
            bodyImageView.image = UIImage(named: "body-\(sender.tag + 1)")
        }else if eyesButton.isSelected == true{
            eyesImageView.image = UIImage(named: "eyes-\(sender.tag + 1)")
        }else if mouthButton.isSelected == true{
            if sender.tag <= 8{
                mouthImageView.image = UIImage(named: "mouth-\(sender.tag + 1)")
            }else{
                mouthImageView.image = nil
            }
        }else if armsButton.isSelected == true{
            if sender.tag <= 8{
                armsImageView.image = UIImage(named: "arms-\(sender.tag + 1)")
            }else{
                armsImageView.image = nil
            }
        }else if legsButton.isSelected == true{
            if sender.tag <= 8{
                legsImageView.image = UIImage(named: "legs-\(sender.tag + 1)")
            }else{
                legsImageView.image = nil
            }
        }else if accButton.isSelected == true{
            if sender.tag <= 8{
                accImageView.image = UIImage(named: "acc-\(sender.tag + 1)")
            }else{
                accImageView.image = nil
            }
        }
        
        
    }
        
    
    
    @IBAction func changePage(_ sender: Any) {
        //設定點選pageControl的圓點時，ScrollView的移動位置(scrollview的寬度*pageControl的頁數)
        let point = CGPoint(x: pageChange.bounds.width * CGFloat(pageControl.currentPage), y: 0)
        pageChange.setContentOffset(point, animated: true)
        
    }
    
    
    @IBAction func randomAppearance(_ sender: Any) {
        //所有部位在1~9的範圍內隨機選擇一個數字的圖片來顯示
        bodyImageView.image = UIImage(named: "body-\(Int.random(in: 1...9))")
        eyesImageView.image = UIImage(named: "eyes-\(Int.random(in: 1...9))")
        mouthImageView.image = UIImage(named: "mouth-\(Int.random(in: 1...9))")
        armsImageView.image = UIImage(named: "arms-\(Int.random(in: 1...9))")
        legsImageView.image = UIImage(named: "legs-\(Int.random(in: 1...9))")
        accImageView.image = UIImage(named: "acc-\(Int.random(in: 1...9))")
        
        //隨機配置身體顏色，用剛剛建立好的randomColor function
        randomColor((Any).self)
                                      
    }
    
    
    @IBAction func chooseColor(_ sender: Any) {
        if colorView.isHidden == true{
            colorView.isHidden = false
        }else{
            colorView.isHidden = true
        }
    }
    
    @IBAction func adjustColor(_ sender: Any) {
        bodyColorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    
    @IBAction func randomColor(_ sender: Any) {
        //設定三個範圍在0~1的隨機浮點數分別給紅色、綠色跟藍色
        let redValue = Float.random(in: 0...1)
        let greenValue = Float.random(in: 0...1)
        let blueValue = Float.random(in: 0...1)
        
        //將亂數設定為身體顏色
        bodyColorView.backgroundColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
        
        //同步更新slider的圓點顯示位置
        redSlider.value = redValue
        greenSlider.value = greenValue
        blueSlider.value = blueValue
        
    }
    
    

}

