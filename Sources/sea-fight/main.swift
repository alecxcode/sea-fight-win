//Copyright (c) 2021 Alexander Vankov (Александр Ваньков)

import Foundation

struct CONST {
  static let PLAYER:   Int = 1
  static let COMPUTER: Int = 0
  static let VERTICAL:   Int = 1
  static let HORISONTAL: Int = 0
}

struct HIT {
  static var Y: Int = 0
  static var X: Int = 0
}

var ships = [Ship]()

gameTitle()
gameStartPrompt()

let playerField = Field(name: "PLAYER", mode: CONST.PLAYER)

let compField = Field(name: "COMPUTER", mode: CONST.COMPUTER)

let comp = computer()

var inputData = ""

var quit = false
var coordsToHIT = ""
var lastmessage = ""
var compAlive = true
var playerAlive = true
var destuctCheck = false
var WINNER = 2
var whoHits = CONST.PLAYER
var playerHitResult = false
var compHitResult = false

// Главный цикл игры:
while quit == false {
  system("cls")
  print("SEA FIGHT\n")
  playerField.writeField()
  compField.writeField()
  print(lastmessage)
  print("CTRL+C to quit")
  print("Enter a coorditate to HIT! (e.g.: 1a, 2b, 10c): ", terminator:"")
  if whoHits == CONST.PLAYER {
    coordsToHIT = askCoords()
    if checkInputedCoords(coordsToHIT) {
      lastmessage = "A HIT into COMPUTER's \(coordsToHIT) was done"
      coordsToHIT = ""
      playerHitResult = compField.hit(HIT.Y, HIT.X)
      if playerHitResult {whoHits = CONST.PLAYER} else {whoHits = CONST.COMPUTER}
    } else {
      lastmessage = "Wrong coords have you entered!, try to enter like this: 1a, 2b, 10c"
      coordsToHIT = ""
    }
  } else if whoHits == CONST.COMPUTER {
    compHitResult = comp.strike()
    lastmessage = "The COMPUTER strikes back, last strike at: " + comp.humaReadableHitPosition(comp.lasty, comp.lastx)
    if compHitResult {whoHits = CONST.COMPUTER} else {whoHits = CONST.PLAYER}
  }
  compAlive = false
  playerAlive = false
  for eachShip in ships {
    destuctCheck = eachShip.checkDestruction()
    if destuctCheck == false && eachShip.field == CONST.COMPUTER {
      compAlive = true
    }
    if destuctCheck == false && eachShip.field == CONST.PLAYER {
      playerAlive = true
    }
  }
  if compAlive == false {quit = true; WINNER = CONST.PLAYER}
  if playerAlive == false {quit = true; WINNER = CONST.COMPUTER}
}

gameEndPrompt(WINNER)
