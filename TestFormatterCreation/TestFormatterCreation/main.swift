import Foundation

var number = 0
let currencyFormatter = NumberFormatter()
currencyFormatter.numberStyle = .currency
let percentFormatter = NumberFormatter()
percentFormatter .numberStyle = .percent
let startTime = mach_absolute_time()

for _ in 1...100_000 {
//    percentFormatter.numberStyle = .currency
//    percentFormatter.numberStyle = .percent
    number += 1
    percentFormatter.string(from: number as NSNumber)
}

let endTime = mach_absolute_time()

print("Duration: \(endTime - startTime)")
/*
 405688
 116916
 create the formatter, set formatter number style, add to the number and format it: 6,110,704; 58,755,717
 set formatter number style, add to the number and format it: 5,648,204; 54,309,212
 add to the number and format it: 320,985; 2,777,645
 */

let word = "abc12abcABC12"
let trimmedWord = word.trimmingCharacters(in: .letters)

print("Checked word: ", trimmedWord)

let checkedWord = trimmedWord.filter {
    Set("0123456789.").contains($0)
}

let numSet = Set("0123456789.qwertyuiopasdfghjklzxcvbnm")
let startTime2 = mach_absolute_time()
for _ in 1...1000000 {
    let checkedWord = trimmedWord.filter {
        "0123456789.qwertyuiopasdfghjklzxcvbnm".contains($0)
//        numSet.contains($0)
    }
}
let endTime2 = mach_absolute_time()
print(endTime2 - startTime2)

print(checkedWord)

let set = Set(checkedWord)
print(set)
/*
 23519014 set
 25587269
 23223718
 58377240 not set
 57889199
 57795369
 
 with letters
 set
 24698008
 not set
 112821873
 */
