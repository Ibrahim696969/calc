//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    func calculate(args: [String]) -> String {
        guard args.count >= 3, args.count % 2 == 1 else {
            fputs("Error: Invalid input format\n", stderr)
            exit(1)
        }

        var tokens = args

        func evaluate(_ lhs: Int, _ op: String, _ rhs: Int) -> Int? {
            switch op {
            case "+": return lhs + rhs
            case "-": return lhs - rhs
            case "x", "×": return lhs * rhs
            case "/": return rhs != 0 ? lhs / rhs : nil
            case "%": return rhs != 0 ? lhs % rhs : nil
            default: return nil
            }
        }

        while tokens.count > 1 {
            guard let lhs = Int(tokens[0]),
                  let op = tokens[1] as String?,
                  let rhs = Int(tokens[2]),
                  let result = evaluate(lhs, op, rhs),
                  result >= Int32.min, result <= Int32.max else {
                fputs("Error: Invalid operation or overflow\n", stderr)
                exit(1)
            }

            tokens.replaceSubrange(0...2, with: [String(result)])
        }

        return tokens[0]
    }
}
