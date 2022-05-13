import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak private var textField1: UITextField!
    @IBOutlet weak private var textField2: UITextField!
    
    @IBOutlet weak private var arithmeticSegment: UISegmentedControl!
    
    @IBOutlet weak private var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textFields: [UITextField] = [textField1, textField2]
        textFields.forEach({ $0.keyboardType = .numberPad })
        
        arithmeticSegment.setTitle("+", forSegmentAt: 0)
        arithmeticSegment.setTitle("-", forSegmentAt: 1)
        arithmeticSegment.setTitle("×", forSegmentAt: 2)
        arithmeticSegment.setTitle("÷", forSegmentAt: 3)
        
        arithmeticSegment.selectedSegmentIndex = 0
    }
    
    @IBAction func calculate(_ sender: Any) {
        
        guard let number1 = Double(textField1.text ?? ""), let number2 = Double(textField2.text ?? "") else  {
            resultLabel.text = "数字を入力して下さい。"
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
                resultLabel.text = "割る数には0以外を入力して下さい。"
                return
            }
            
            total = (number1 / number2)
        default:
            return
        }
        
        resultLabel.text = total.description
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
        
    }
    
}
