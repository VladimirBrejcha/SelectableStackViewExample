//  Copyright © 2020 VladimirBrejcha. All rights reserved.

import UIKit
import SelectableStackView

final class ViewController: UIViewController {
    @IBOutlet private weak var multipleSelectionStackView: SelectableStackView!
    @IBOutlet private weak var singleSelectionStackView: SelectableStackView!
    
    @IBAction private func selectRandomTouchUp(_ sender: UIButton) {
        (0...multipleSelectionStackView.subviews.count - 1).forEach { number in
            multipleSelectionStackView.select(.random(), at: number)
        }
        
        (0...singleSelectionStackView.subviews.count - 1).forEach { number in
            singleSelectionStackView.select(.random(), at: number)
        }
    }
}
