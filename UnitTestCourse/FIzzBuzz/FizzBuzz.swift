//
//  FizzBuzz.swift
//  UnitTestCourse
//
//  Created by Runyasak Chaengnaimuang on 13/2/2564 BE.
//

import Foundation

class FizzBuzz {
    func say(number: Int) -> String {
        if number % 15 == 0 {
            return "fizzbuzz"
        }
        
        if number % 3 == 0 {
            return "fizz"
        }
        
        if number % 5 == 0 {
            return "buzz"
        }

        return String(number)
    }
}
