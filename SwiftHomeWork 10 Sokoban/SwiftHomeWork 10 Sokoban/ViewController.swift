/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    21.10.2019
 Номер задания: 10
 Текст задания:
 Игра Sokoban
 
 10.1. Создайте тип Комната (Room). У комнаты есть размеры width на height. И создайте тип Персонаж (Player). У него есть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате
 
 10.2. (1 балл) Персонажу добавьте метод идти (move(to direction: Direction) ), который принимает энум Direction: лево, право, верх, вниз
 Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически
 
 10.3. (1 балл) Создать тип Ящик (Box). У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
 
 10.4. (2 балла) Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)
 
 10.5. (2 балла) Добавьте точку в комнате, куда надо ящик передвинуть и двигайте. Когда ящик окажется в целевой точке, то выдать надпись: "Вы победили!" :)
 
 10.6. (2 балла) добавьте возможность загрузить конфигурацию комнаты с помощью строкового массива:
 let roomString = """
 xxxxxxxxxx
 x........x
 xxx......x
 x...*....x
 x......+.x
 x..xx....x
 x..$.....x
 x........x
 xxxxxxxxxx
 Где
 х - непроходимая стена
 * - ящик
 + - целевая точка, куда нужно передвинуть ящик
 $ - Игрок
 
 10.7. (2 балла) Добавьте возможность не проходить сквозь стены, которые расставлены внутри комнаты, помеченные "х"
 */


import UIKit

class ViewController: UIViewController {
    
    //Enums
    enum Directions {
        case left
        case right
        case up
        case down
    }
    

    //Outlets
    @IBOutlet weak var roomTextLabel: UILabel!
    
    
    //Variables
    let roomSize: Room = Room(width: 16, height: 10)
    var currentPlayer = Player(xCoordinate: 0, yCoordinate: 0)
    var currentBox = Box(xCoordinate: 0, yCoordinate: 0)
    var currentWinningPosition = winnigPosition(xCoordinate: 0, yCoordinate: 0)
    var gameIsOver = false
    var wallTileArray: [WallTile] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
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
                            box.beingMoved(direction: .up, room: room, wallArray: wallArray)
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
                        box.beingMoved(direction: .left, room: room, wallArray: wallArray)
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
                        box.beingMoved(direction: .right, room: room, wallArray: wallArray)
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
                        box.beingMoved(direction: .down, room: room, wallArray: wallArray)
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
    
    
    //Functions
    func DrawRoom (_ currentRoom: Room) {
        var newRoomString: String = ""
        
        
        if (newRoomString == "") {
        for lineIndex in 0..<currentRoom.height
        {
                for columnIndex in 0..<currentRoom.width
                {
                    if (lineIndex == currentPlayer.yCoordinate && columnIndex == currentPlayer.xCoordinate) {
                        newRoomString += "🕺"
                    } else if (lineIndex == currentBox.yCoordinate && columnIndex == currentBox.xCoordinate) {
                        newRoomString += "📦"
                    } else if (lineIndex == currentWinningPosition.yCoordinate && columnIndex == currentWinningPosition.xCoordinate) {
                        newRoomString += "❌"
                    } else if (lineIndex == 0 || (lineIndex == currentRoom.height-1) || columnIndex == 0 || (columnIndex == currentRoom.width - 1)) {
                        newRoomString += "🚧"
                    } else {
                        var wallExist: Bool = false
                        for index in 0..<wallTileArray.count
                        {
                            if (lineIndex == wallTileArray[index].yCoordinate && columnIndex == wallTileArray[index].xCoordinate) {
                                newRoomString += "🚧"
                                wallExist = true
                            }
                        }
                        if wallExist != true {
                            newRoomString += "🌫"
                        }
                    }
                }
                newRoomString += "\n"
            }
        }
        roomTextLabel.text = newRoomString
        
        checkIfEndGame()
    }
    

    func objectsCreation () {
        
        //Player Creation
        var randomXValue = Int.random(in: 2...13)
        var randomYValue = Int.random(in: 2...7)
        currentPlayer.xCoordinate = randomXValue
        currentPlayer.yCoordinate = randomYValue
        
        
        //Box Creation
        randomXValue = Int.random(in: 2...13)
        randomYValue = Int.random(in: 2...7)
        while (randomXValue == currentPlayer.xCoordinate || randomYValue == currentPlayer.yCoordinate) {
            randomXValue = Int.random(in: 2...13)
            randomYValue = Int.random(in: 2...7)
        }
        currentBox.xCoordinate = randomXValue
        currentBox.yCoordinate = randomYValue
        
        
        //Winning Position Creation
        randomXValue = Int.random(in: 2...13)
        randomYValue = Int.random(in: 2...7)
        while (randomXValue == currentPlayer.xCoordinate || randomYValue == currentPlayer.yCoordinate || randomXValue == currentBox.xCoordinate || randomYValue == currentBox.yCoordinate) {
            randomXValue = Int.random(in: 2...13)
            randomYValue = Int.random(in: 2...7)
        }
        currentWinningPosition.xCoordinate = randomXValue
        currentWinningPosition.yCoordinate = randomYValue
        
        
        //Wall Tiles Creation
        let wallsCount = Int.random(in: 1...2)
        var wallsTempArray: [WallTile] = []
        for _ in 0..<wallsCount
        {
            let randomLength = Int.random(in: 1...4)
            let isHorizontal = Bool.random()
            
            randomXValue = Int.random(in: 2...13)
            randomYValue = Int.random(in: 2...7)
            while (randomXValue == currentPlayer.xCoordinate || randomYValue == currentPlayer.yCoordinate || randomXValue == currentBox.xCoordinate || randomYValue == currentBox.yCoordinate || randomXValue == currentWinningPosition.xCoordinate || randomYValue == currentWinningPosition.yCoordinate) {
                    randomXValue = Int.random(in: 2...13)
                    randomYValue = Int.random(in: 2...7)
            }
            for index in 0..<randomLength
            {
                if isHorizontal {
                   wallsTempArray.append(WallTile(xCoordinate: (randomXValue + index), yCoordinate: randomYValue))
                } else {
                    wallsTempArray.append(WallTile(xCoordinate: randomXValue, yCoordinate: (randomYValue + index)))
                }
            }
        }
        wallTileArray = wallsTempArray
    }
    
    
    func startNewGame () {
        objectsCreation()
        DrawRoom(roomSize)
    }
    
    
    func checkIfEndGame () {
        if (currentBox.xCoordinate == currentWinningPosition.xCoordinate && currentBox.yCoordinate == currentWinningPosition.yCoordinate) {
            let alert = UIAlertController (title: title, message: "You Won!", preferredStyle: .alert)
            
            let action = UIAlertAction (title: "OK", style: .default, handler: {
                action in
                self.startNewGame()
            })
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    //Buttons Actions
    @IBAction func buttonUpClicked () {
        currentPlayer.move(direction: Directions.up, room: roomSize, box: &currentBox, wallArray: wallTileArray)
        DrawRoom(roomSize)
    }
    
    @IBAction func buttonLeftClicked () {
        currentPlayer.move(direction: Directions.left, room: roomSize, box: &currentBox, wallArray: wallTileArray)
        DrawRoom(roomSize)
    }
    
    @IBAction func buttonRightClicked () {
        currentPlayer.move(direction: Directions.right, room: roomSize, box: &currentBox, wallArray: wallTileArray)
        DrawRoom(roomSize)
    }
    
    @IBAction func buttonDownClicked () {
        currentPlayer.move(direction: Directions.down, room: roomSize, box: &currentBox, wallArray: wallTileArray)
        DrawRoom(roomSize)
    }

}
