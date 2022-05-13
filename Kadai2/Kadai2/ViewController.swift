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
        
        self.arithmeticSegment.setTitle("+", forSegmentAt: 0)
        self.arithmeticSegment.setTitle("-", forSegmentAt: 1)
        self.arithmeticSegment.setTitle("×", forSegmentAt: 2)
        self.arithmeticSegment.setTitle("÷", forSegmentAt: 3)
        
        self.arithmeticSegment.selectedSegmentIndex = 0
    }
    
    @IBAction func calculate(_ sender: Any) {
        
        guard let number1 = Double(self.textField1.text ?? ""), let number2 = Double(self.textField2.text ?? "") else  {
            self.resultLabel.text = "数字を入力して下さい。"
            return
        }
        
        let total: Double
        
        switch arithmeticSegment.selectedSegmentIndex {
        case 0:
            total = (number1 + number2)
        case 1:
            total = (number1 - number2)
        case 2:
            total = (number1 * number2)
        case 3:
            guard number2 != 0 else {
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
