//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

let args = CommandLine.arguments.dropFirst()

let calc = Calculator()
let result = calc.calculate(args: Array(args))
print(result)
