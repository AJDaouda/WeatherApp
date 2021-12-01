//
//  CleanJsonExtension.swift
//  Oct21_Final_Project
//
//  Created by user203897 on 10/26/21.
//

import Foundation
extension String {
    func cleanJson() -> String {
        let start = self.index(self.startIndex, offsetBy: 2)
        let end = self.index(self.endIndex, offsetBy: -3)
        let range = start...end
        return  String(self[range])
    }
}
