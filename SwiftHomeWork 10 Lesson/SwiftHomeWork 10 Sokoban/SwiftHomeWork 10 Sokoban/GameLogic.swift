//
//  GameLogic.swift
//  SwiftHomeWork 10 Sokoban
//
//  Created by Максим on 11/4/19.
//  Copyright © 2019 Максим. All rights reserved.
//

import Foundation

//Enums
enum Directions {
    case left
    case right
    case up
    case down
}

struct Room {
    var width: Int
    var height: Int
}


struct Player {
    var xCoordinate: Int
    var yCoordinate: Int
    
    mutating func move (direction: Directions, room: Room, box: inout Box, wallArray: [WallTile]) {
        switch direction {
        case .up: var wallAhead: Bool = false
        for index in 0..<wallArray.count
        {
            if (wallArray[index].yCoordinate == (self.yCoordinate - 1) && wallArray[index].xCoordinate == self.xCoordinate) {
                wallAhead = true
                break
            }
        }
        if (self.yCoordinate == 1 || wallAhead) {
            break
        } else {
            self.yCoordinate -= 1
            if (self.yCoordinate == box.yCoordinate && self.xCoordinate == box.xCoordinate) {
                if (box.yCoordinate == 1) {
                    self.yCoordinate += 1
                } else {
                    box.beingMoved(direction: .up, room: room, wallArray: wallArray)
                }
            }
            }
        case .left: var wallAhead: Bool = false
        for index in 0..<wallArray.count
        {
            if (wallArray[index].yCoordinate == self.yCoordinate && wallArray[index].xCoordinate == (self.xCoordinate - 1)) {
                wallAhead = true
                break
            }
        }
        if (self.xCoordinate == 1 || wallAhead) {
            break
        } else {
            self.xCoordinate -= 1
            if (self.yCoordinate == box.yCoordinate && self.xCoordinate == box.xCoordinate) {
                if (box.xCoordinate == 1) {
                    self.xCoordinate += 1
                } else {
                    box.beingMoved(direction: .left, room: room, wallArray: wallArray)
                }
            }
            }
        case .right: var wallAhead: Bool = false
        for index in 0..<wallArray.count
        {
            if (wallArray[index].yCoordinate == self.yCoordinate && wallArray[index].xCoordinate == (self.xCoordinate + 1)) {
                wallAhead = true
                break
            }
        }
        if (self.xCoordinate == (room.width - 2) || wallAhead) {
            break
        } else {
            self.xCoordinate += 1
            if (self.yCoordinate == box.yCoordinate && self.xCoordinate == box.xCoordinate) {
                if (box.xCoordinate == room.width - 2) {
                    self.xCoordinate -= 1
                } else {
                box.beingMoved(direction: .right, room: room, wallArray: wallArray)
                }
            }
            }
        case .down: var wallAhead: Bool = false
        for index in 0..<wallArray.count
        {
            if (wallArray[index].yCoordinate == (self.yCoordinate + 1) && wallArray[index].xCoordinate == self.xCoordinate) {
                wallAhead = true
                break
            }
        }
        if (self.yCoordinate == (room.height - 2) || wallAhead) {
            break
        } else {
            self.yCoordinate += 1
            if (self.yCoordinate == box.yCoordinate && self.xCoordinate == box.xCoordinate) {
                if (box.yCoordinate == room.height - 2) {
                    self.yCoordinate -= 1
                } else {
                box.beingMoved(direction: .down, room: room, wallArray: wallArray)
                }
            }
            }
        }
    }
}


struct Box {
    var xCoordinate: Int
    var yCoordinate: Int
    
    mutating func beingMoved (direction: Directions, room: Room, wallArray: [WallTile]) {
        switch direction {
        case .up: var wallAhead: Bool = false
        for index in 0..<wallArray.count
        {
            if (wallArray[index].yCoordinate == (self.yCoordinate - 1) && wallArray[index].xCoordinate == self.xCoordinate) {
                wallAhead = true
                break
            }
        }
        if (self.yCoordinate == 1 || wallAhead) {
            break
        } else {
            self.yCoordinate -= 1
            }
        case .left: var wallAhead: Bool = false
        for index in 0..<wallArray.count
        {
            if (wallArray[index].yCoordinate == self.yCoordinate && wallArray[index].xCoordinate == (self.xCoordinate - 1)) {
                wallAhead = true
                break
            }
        }
        if (self.xCoordinate == 1 || wallAhead) {
            break
        } else {
            self.xCoordinate -= 1
            }
        case .right: var wallAhead: Bool = false
        for index in 0..<wallArray.count
        {
            if (wallArray[index].yCoordinate == self.yCoordinate && wallArray[index].xCoordinate == (self.xCoordinate + 1)) {
                wallAhead = true
                break
            }
        }
        if (self.xCoordinate == (room.width - 2) || wallAhead) {
            break
        } else {
            self.xCoordinate += 1
            }
        case .down: var wallAhead: Bool = false
        for index in 0..<wallArray.count
        {
            if (wallArray[index].yCoordinate == (self.yCoordinate + 1) && wallArray[index].xCoordinate == self.xCoordinate) {
                wallAhead = true
                break
            }
        }
        if (self.yCoordinate == (room.height - 2) || wallAhead) {
            break
        } else {
            self.yCoordinate += 1
            }
        }
    }
}


struct WallTile {
    var xCoordinate: Int
    var yCoordinate: Int
}


struct winnigPosition {
    var xCoordinate: Int
    var yCoordinate: Int
}

