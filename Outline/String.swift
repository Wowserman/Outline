//
//  String.swift
//  Outline
//
//  Created by Peter on 12/21/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation

extension String {
    func equalsIgnoreCase(string: String) -> Bool {
        return self.lowercased() == string.lowercased()
    }
}
