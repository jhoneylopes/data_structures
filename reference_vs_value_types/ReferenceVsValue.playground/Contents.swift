//: # Quando usar Reference Type ou Value Type?

import Foundation

//: ### Reference Type

class ReferencePlayer {
    var playerClass = ""
}

let referencePlayer = ReferencePlayer()

let player1 = referencePlayer
player1.playerClass = "Guerreiro"
let player2 = referencePlayer
player2.playerClass = "Mago"

print(player1.playerClass) // Mago
print(player2.playerClass) // Mago

//: ### Value Type

struct ValuePlayer {
    var playerClass = ""
}

let valuePlayer = ValuePlayer()

var player3 = valuePlayer
player3.playerClass = "Guerreiro"
var player4 = valuePlayer
player4.playerClass = "Mago"

print(player3.playerClass) // Guerreiro
print(player4.playerClass) // Mago



























