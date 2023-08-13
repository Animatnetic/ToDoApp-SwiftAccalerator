//
//  Optional+bound.swift
//  ToDoApp
//
//  Created by Faris Ansari on 13/08/2023.
//

import Foundation

// Stack overflow solution source: https://stackoverflow.com/a/57041232/18003898

extension Optional where Wrapped == String {
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    public var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}
