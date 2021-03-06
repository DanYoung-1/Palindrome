//
//  PalindromeTests.swift
//  PalindromeTests
//
//  Created by Daniel Young on 10/14/20.
//

import XCTest
@testable import Palindrome

struct PalindromePrinter {
    func check(s: String) -> String {
        switch s.count {
        case 0: return "False"
        case 1: return "True"
        default:
            let mIndex = s.index(s.startIndex, offsetBy: s.count / 2)
            let sub2Index = s.index(s.startIndex, offsetBy: (s.count / 2)+1)
            if String(s[..<mIndex]) == String(s[sub2Index...].reversed()) {
                return "True"
            }
            return "False"
        }
    }
}

class PalindromeTests: XCTestCase {
    
    func test_PrintFalseWhenDigitsCountEqualsZero() {
        expect(input: "", result: "False")
    }
    
    func test_PrintTrueWhenDigitsCountEqualsOne() {
        expect(input: "1", result: "True")
    }
    
    func test_PrintFalseWhenDigitsCountEqualsTwoNonPalindrome() {
        expect(input: "12", result: "False")
    }
    
    
    func test_PrintTrueWhenDigitCountIsEvenPalindrome() {
        ["44","1221","123321","12344321"].forEach {
            expect(input: $0, result: "False")
        }
    }
    
    func test_PrintFalseWhenOddDigitCountNonPalindrome() {
        ["122","12345","7654321"].forEach {
            expect(input: $0, result: "False")
        }
    }
    
    private func makeSUT() -> PalindromePrinter {
        return PalindromePrinter()
    }
    
    private func expect(input: String, result: String) {
        let sut = makeSUT()
        XCTAssertEqual(sut.check(s: input), result)
    }
}
