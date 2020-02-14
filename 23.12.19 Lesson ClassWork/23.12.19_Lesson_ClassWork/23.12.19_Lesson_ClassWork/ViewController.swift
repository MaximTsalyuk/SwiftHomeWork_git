/*
 // Классная работа: сделать каталог эмоций из этого массива.
 
 var emojis: [Emoji] = [
 Emoji(symbol: "😀", name: "Grinning Face",
 description: "A typical smiley face.", usage: "happiness"),
 Emoji(symbol: "😕", name: "Confused Face",
 description: "A confused, puzzled face.", usage: "unsure
 what to think; displeasure"),
 Emoji(symbol: "😍", name: "Heart Eyes",
 description: "A smiley face with hearts for eyes.",
 usage: "love of something; attractive"),
 Emoji(symbol: "👮", name: "Police Officer",
 description: "A police officer wearing a blue cap with a gold
 badge.", usage: "person of authority"),
 Emoji(symbol: "🐢", name: "Turtle", description:
 "A cute turtle.", usage: "Something slow"),
 Emoji(symbol: "🐘", name: "Elephant", description:
 "A gray elephant.", usage: "good memory"),
 Emoji(symbol: "🍝", name: "Spaghetti",
 description: "A plate of spaghetti.", usage: "spaghetti"),
 Emoji(symbol: "🎲", name: "Die", description: "A
 single die.", usage: "taking a risk, chance; game"),
 Emoji(symbol: "⛺️", name: "Tent", description: "A
 small tent.", usage: "camping"),
 Emoji(symbol: "📚", name: "Stack of Books",
 description: "Three colored books stacked on each other.",
 usage: "homework, studying"),
 Emoji(symbol: "💔", name: "Broken Heart",
 description: "A red, broken heart.", usage: "extreme
 sadness"), Emoji(symbol: "💤", name: "Snore",
 description:
 "Three blue \'z\'s.", usage: "tired, sleepiness"),
 Emoji(symbol: "🏁", name: "Checkered Flag",
 description: "A black-and-white checkered flag.", usage:
 "completion")]»
 
 
 */


import UIKit


class Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}


class ViewController: UIViewController {
    var currentIndexPath = 0
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face",
              description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face",
              description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes",
              description: "A smiley face with hearts for eyes.",
              usage: "love of something; attractive"),
        Emoji(symbol: "👮", name: "Police Officer",
              description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
        Emoji(symbol: "🐢", name: "Turtle", description:
            "A cute turtle.", usage: "Something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description:
            "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti",
              description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books",
              description: "Three colored books stacked on each other.",
              usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart",
              description: "A red, broken heart.", usage: "extreme sadness"), Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "Cell_ID", for: indexPath)
        cell.textLabel?.text = "\(emojis[indexPath.row].symbol) \(emojis[indexPath.row].name)"
        cell.detailTextLabel?.text = "\(emojis[indexPath.row].description)"
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondViewControllerSegue" {
            let secondViewController = segue.destination as? SecondViewController
            secondViewController?.transferMainLabelData = emojis[currentIndexPath].symbol
            secondViewController?.transferDescriptionLabelData = emojis[currentIndexPath].description
            secondViewController?.transferTitleLabelData = emojis[currentIndexPath].name
            secondViewController?.transferDetailLabelData = emojis[currentIndexPath].usage
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndexPath = indexPath.row
        performSegue(withIdentifier: "secondViewControllerSegue", sender: self)
    }
}
