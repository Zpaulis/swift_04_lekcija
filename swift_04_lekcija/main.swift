//
//  main.swift
//  swift_04_lekcija
//
//  Created by Paulis Zabarovskis on 16/04/2022.
//

import Foundation

// MARK: - OOP

class Control {            // Root class
// Properties
    var label:String?
    var value:String?
    var id:Int = 0
    var frame:Rect?

// Calculated property
    var ratio:Float? {
        get {        // getter
            guard let frame = self.frame else {
                return nil
            }
// Check if width is not zero.
            if frame.width == 0 {
                return nil
            }
            return Float(frame.height) / Float(frame.width)
        }
    }

// Lazy property
    lazy var placeholder:String = "Control placeholder"


    var totalSteps:Int = 0 {
// Called before value change
        willSet(newTotalStep) {
            print("Old value:\(self.totalSteps), new value \(newTotalStep)")
        }
// Called just after value changed
// Reserved: oldValue
        didSet {
            print("Old value:\(oldValue) did replace with new value \(self.totalSteps)")
            if self.totalSteps > oldValue {
                print("increased by \(self.totalSteps - oldValue)")
            }
        }
    }



// Constructor
    init() {            // Designated initializer
        self.label = "Default label"
        self.value = nil
        self.id = -1
    }
    init(withId id:Int) {
        self.id = id
    }

// Methods
    func printInfo() {
        print("Control with id=\(self.id), label='\(self.label)', value='\(self.value)'")
    }
}    // End of class control declaration

// MARK: -  Klases lietosana

var button = Control()                // Constructor
var checkbox:Control?                // optional variable witj class Control


button.printInfo()
button.label = "Save"
button.value = "100"
button.id = 12
button.printInfo()


var doneButton = Control.init(withId: 20)
doneButton.printInfo()

// MARK: - Subclass radio
var radioColor = Radio.init(withItems: 5, withId: 30)
radioColor.label = "Choise color"
radioColor.value = "red"
radioColor.printInfo()

radioColor.frame = Rect.init(x: 50, y: 70, width: 320, height: 50)



// Calculated property
let r1 = radioColor.ratio

radioColor.frame = nil
print(radioColor.ratio)

radioColor.frame = Rect.init(x: 50, y: 70, width: 0, height: 50)
print(radioColor.ratio)


// Lazy property
print("Lazy property:\(radioColor.placeholder)")



// Events: willSet, didSet

radioColor.totalSteps = 10

radioColor.totalSteps = 30

radioColor.totalSteps = 60




print("Hello, World!")

