import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak private var textField1: UITextField!
    @IBOutlet weak private var textField2: UITextField!
    
    @IBOutlet weak private var arithmeticSegment: UISegmentedControl!
    
    @IBOutlet weak private var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textFields: [UITextField] = [self.textField1, self.textField2]
        textFields.forEach({ $0.keyboardType = .numberPad })
        
        self.arithmeticSegment.selectedSegmentIndex = -1
        self.arithmeticSegment.setTitle("+", forSegmentAt: 0)
        self.arithmeticSegment.setTitle("-", forSegmentAt: 1)
        self.arithmeticSegment.setTitle("×", forSegmentAt: 2)
        self.arithmeticSegment.setTitle("÷", forSegmentAt: 3)
        
    }
    
    @IBAction func calculate(_ sender: Any) {
        
        guard let number1 = Double(self.textField1.text ?? ""), let number2 = Double(self.textField2.text ?? "") else  {
            self.resultLabel.text = "数字を入力して下さい。"
            return
        }
        
        var total: Double!
        
        guard !(arithmeticSegment.selectedSegmentIndex == -1) else {
            self.resultLabel.text = "計算方法を選択して下さい。"
            return
        }
        
        switch self.arithmeticSegment.titleForSegment(at: self.arithmeticSegment.selectedSegmentIndex) {
            
        case "＋":
            
            total = (number1 + number2)
            
        case "-":
            
            total = (number1 - number2)
            
        case "×":
            
            total = (number1 * number2)
            
        case "÷":
            
            guard !(number2 == 0) else {
                self.resultLabel.text = "割る数には0以外を入力して下さい。"
                return
            }
            
            total = (number1 / number2)
            
        default:
            
            return
            
        }
        
        self.resultLabel.text = total.description
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
        
    }
    
}
