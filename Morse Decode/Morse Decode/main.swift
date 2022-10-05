//
//  main.swift
//  Morse Decode
//
//  Created by Eduarda Pinheiro on 03/10/22.
//

import Foundation

var englishText = "Duda Mel"
var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-.   ---... -.--.-".lowercased()

//Dictionary that store individual letters of the alphabet as String type keys and their morse counterpart as String type values
var letterToMorse = [
    "A": ".-",
    "B": "-...",
    "C": "-.-.",
    "D": "-..",
    "E": ".",
    "F": "..-.",
    "G": "--.",
    "H": "....",
    "I": "..",
    "J": ".---",
    "K": "-.-",
    "L": ".-..",
    "M": "--",
    "N": "-.",
    "O": "---",
    "P": ".--.",
    "Q": "--.-",
    "R": ".-.",
    "S": "...",
    "T": "-",
    "U": "..-",
    "V": "...-",
    "W": ".--",
    "X": "-..-",
    "Y": "-.--",
    "Z": "--..",
    ".": ".-.-.-",
    ",": "--..--",
    "?": "..--..",
    "'": ".----.",
    "!": "-.-.--",
    "/": "-..-.",
    "(": "-.--.",
    ")": "-.--.-",
    "&": ".-...",
    ":": "---...",
    ";": "-.-.-.",
    "=": "-...-",
    "+": ".-.-.",
    "-": "-....-",
    "_": "..--.-",
    "$": "...-..-",
    "@": ".--.-."
]

var morseText: String = ""                         ////This variable will store the encrypted message

for element in englishText {
    if let morseChar = letterToMorse["\(element)"] {
        morseText += morseChar + " "
    } else {
        morseText += "   "
    }
}
print("Coded message: \(morseText)")

var decodedMessage: String = ""   ////This variable will store the decoded message version of secret message
var morseCodeArray = [String]()   ////This array will store individual Morse code letters
var currMorse: String = ""        ////This variable will keep track of our current Morse code letter


for char in secretMessage {
    if char != " " {
        currMorse.append(char)
    }
    else {
        switch currMorse {
        case "":
            currMorse += " "
        case " ":
            morseCodeArray.append(" ")
            currMorse = ""
        default:
            morseCodeArray.append(currMorse)
            currMorse = ""
        }
    }
}
morseCodeArray.append(currMorse)
//This dictionary will store morse code as keys and letters as values
var morseToLetter = [String:String]()

for (letter,morseChar) in letterToMorse {
    morseToLetter[morseChar] = letter
}

for morseValue in morseCodeArray {
    if let letterChar = morseToLetter[morseValue] {
        decodedMessage.append(letterChar)
    } else {
        decodedMessage += " "
    }
}
print("Decoded message: \(decodedMessage)")
