//
//  Radio.swift
//  swift_04_lekcija
//
//  Created by Paulis Zabarovskis on 16/04/2022.
//

import Foundation

class Radio:Control {
    var numberOfChoises:Int
    init(withItems items:Int, withId id:Int) {
        self.numberOfChoises = items
        super.init(withId: id)
    }
    override func printInfo() {
        super.printInfo()        // Drukajam Control klases metodi
        print("Choises:\(self.numberOfChoises)")    // Drukajam šīs klases metodi
    }
}
