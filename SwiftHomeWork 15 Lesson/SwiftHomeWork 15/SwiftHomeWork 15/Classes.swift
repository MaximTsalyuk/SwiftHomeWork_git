import Foundation

// Classes

class Family {
    let mother: Mother
    let father: Father
    var children: [Child]
    
    init (mother: Mother, father: Father, children: [Child]) {
        self.mother = mother
        self.father = father
        self.children = children
        self.mother.family = self
        self.father.family = self
        for item in self.children
        {
            item.family = self
        }
    }
}


class Mother {
    weak var family: Family?
    static var liveCount: Int = 0
    let name: String
    
    init (name: String) {
        self.name = name
        Mother.liveCount += 1
        print("MotherLiveCount: \(Mother.liveCount)")
    }
    
    deinit {
        Mother.liveCount -= 1
        print("MotherLiveCount: \(Mother.liveCount)")
    }
    
    lazy var childrenGoToSleep: (() -> Void) = { [weak self] in
        if (self?.family?.children != nil) {
            print("\(self!.name) \(#function)")
            for item in (self?.family!.children)!
            {
                item.goToSleep()
            }
        }
    }
    
    lazy var husbandBuyBoots: (() -> Void) = { [weak self] in
        print("\(self!.name) \(#function)")
        self!.family?.father.buyBoots()
    }
    
    lazy var cookMeat: (() -> Void) = { [weak self] in
        print("\(self!.name) \(#function)")
        print("Cooking meat!")
    }
}


class Father {
    weak var family: Family?
    static var liveCount: Int = 0
    let name: String
    
    init (name: String) {
        self.name = name
        Father.liveCount += 1
        print("FatherLiveCount: \(Father.liveCount)")
    }
    
    deinit {
        Father.liveCount -= 1
        print("FatherLiveCount: \(Father.liveCount)")
    }
    
    lazy var buyBoots: (() -> Void) = { [weak self] in
        print("\(self!.name) \(#function)")
        print("Bought boots!")
    }
    
    lazy var childrenGoToSleep: (() -> Void) = { [weak self] in
        if (self!.family?.children != nil) {
            print("\(self!.name) \(#function)")
            for item in self!.family!.children
            {
                item.goToSleep()
            }
        }
    }
    
    lazy var wifeCookMeat: (() -> Void) = { [weak self] in
        print("\(self!.name) \(#function)")
        self!.family!.mother.cookMeat()
    }
}


class Child {
    weak var family: Family?
    static var liveCount: Int = 0
    let name: String
    
    init (name: String) {
        self.name = name
        Child.liveCount += 1
        print("ChildLiveCount: \(Child.liveCount)")
    }
    
    deinit {
        Child.liveCount -= 1
        print("ChildLiveCount: \(Child.liveCount)")
    }
    
    lazy var goToSleep: (() -> Void) = { [weak self] in
        print("\(self!.name) \(#function)")
        print("Sleeping!")
    }
    
    lazy var letsPlayFootbal: (() -> Void) = { [weak self] in
        print("\(self!.name) \(#function)")
        for item in self!.family!.children
        {
            item.playFootbal()
        }
    }
    
    lazy var playFootbal: (() -> Void) = { [weak self] in
        print("\(self!.name) \(#function)")
        print("Play football!")
    }
    
    lazy var momCookMeat: (() -> Void) = { [weak self] in
        print("\(self!.name) \(#function)")
        self!.family?.mother.cookMeat()
    }
}
