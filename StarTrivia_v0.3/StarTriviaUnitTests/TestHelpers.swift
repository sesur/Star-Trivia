//
//  TestHelpers.swift
//  StarTriviaUnitTests
//
//  Created by Sergiu on 06.09.2021.
//  Copyright © 2021 Sergiu. All rights reserved.
//

import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

func tap(_ button: UIBarButtonItem) {
    button.target?.perform(button.action, with: nil)
}
