//  Copyright © 2020 VladimirBrejcha. All rights reserved.

import UIKit
import SelectableStackView

final class MultipleSelectionButton: UIButton, SelectionObservableView {
    var selectionObserver: ((SelectionObservableView) -> Void)?
    var handlingSelfSelection: Bool = false
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }

    private func sharedInit() {
        layer.cornerRadius = 16
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1)
        setTitleColor(.black, for: .normal)
        setTitleColor(.black, for: .selected)
        addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
    }
    
    @objc private func touchUpInside(_ sender: MultipleSelectionButton) {
        selectionObserver?(self)
    }
}


