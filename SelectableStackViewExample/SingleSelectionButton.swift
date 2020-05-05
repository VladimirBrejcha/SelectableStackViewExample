//  Copyright © 2020 VladimirBrejcha. All rights reserved.

import UIKit
import SelectableStackView

final class SingleSelectionButton: UIButton, SelectionObservableView {
    var selectionObserver: ((SelectionObservableView) -> Void)?
    var handlingSelfSelection: Bool = false
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }

    private func sharedInit() {
        backgroundColor = .clear
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2), for: .normal)
        setTitleColor(.white, for: .selected)
        addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
    }
    
    @objc private func touchUpInside(_ sender: SingleSelectionButton) {
        selectionObserver?(self)
    }
}
