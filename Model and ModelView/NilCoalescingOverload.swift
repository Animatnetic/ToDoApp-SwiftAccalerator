//
//  nilCoalescingOverload.swift
//  ToDoApp
//
//  Created by Faris Ansari on 13/08/2023.
//

import Foundation
import SwiftUI

// Below is an operator overload that I have gotten from https://stackoverflow.com/a/61002589/18003898

func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
