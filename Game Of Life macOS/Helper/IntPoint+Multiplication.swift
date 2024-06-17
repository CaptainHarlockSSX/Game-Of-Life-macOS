//
//  IntPoint+Multiplication.swift
//  Game Of Life macOS
//
//  Created by Nathan Rassié on 14/06/2024.
//

import Foundation
import SwiftyLife

extension IntPoint {
	static func * (lhs: IntPoint, rhs: UIntSize) -> IntPoint {
		if Int(exactly: rhs.width) != nil && Int(exactly: rhs.height) != nil {
			return IntPoint(x: lhs.x * Int(rhs.width), y: lhs.y * Int(rhs.height))
		} else {
			fatalError("The right hand size of the multiplication (UInt) does not fit within Int size.")
		}
	}
}
