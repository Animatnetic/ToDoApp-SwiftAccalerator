//
//  nilCoalescingOverload.swift
//  ToDoApp
//
//  Created by Faris Ansari on 13/08/2023.
//

import Foundation
import SwiftUI

func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
