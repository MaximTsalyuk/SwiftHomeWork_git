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
        self.mother.Family = self
        self.father.Family = self
        for item in self.children
        {
            item.Family = self
        }
    }
}


class Mother {
    weak var Family: Family?
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
    
    func childrenGoToSleep() {
        if (self.Family?.children != nil) {
            print("\(self.name) \(#function)")
            for item in self.Family!.children
            {
                item.goToSleep()
            }
        }
    }
    
    func husbandBuyBoots() {
        print("\(self.name) \(#function)")
        self.Family?.father.buyBoots()
    }
    
    func cookMeat() {
        print("\(self.name) \(#function)")
        print("Cooking meat!")
    }
}


class Father {
    weak var Family: Family?
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
    
    func buyBoots() {
        print("\(self.name) \(#function)")
        print("Bought boots!")
    }
    
    func childrenGoToSleep() {
        print("\(self.name) \(#function)")
        if (self.Family?.children != nil) {
            for item in self.Family!.children
            {
                item.goToSleep()
            }
        }
    }
    
    func wifeCookMeat() {
        print("\(self.name) \(#function)")
        self.Family?.mother.cookMeat()
    }
}


class Child {
    weak var Family: Family?
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
    
    func goToSleep() {
        print("\(self.name) \(#function)")
        print("Sleeping!")
    }
    
    func letsPlayFootbal() {
        print("\(self.name) \(#function)")
        for item in self.Family!.children
        {
            item.playFootbal()
        }
    }
    
    func playFootbal() {
        print("\(self.name) \(#function)")
        print("Play football!")
    }
    
    func momCookMeat() {
        print("\(self.name) \(#function)")
        self.Family?.mother.cookMeat()
    }
}
