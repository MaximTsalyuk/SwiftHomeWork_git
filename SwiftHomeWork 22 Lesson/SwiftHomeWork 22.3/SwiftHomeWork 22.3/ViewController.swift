import UIKit


class Ruler {
    var mainPhotoName: String
    var coatOfArmsPhotoName: String
    var name: String
    var dynasty: String
    
    init(mainPhotoName: String, coatOfArmsPhotoName: String, name: String, dynasty: String) {
        self.mainPhotoName = mainPhotoName
        self.coatOfArmsPhotoName = coatOfArmsPhotoName
        self.name = name
        self.dynasty = dynasty
    }
}


class ViewController: UIViewController {
    var currentIndexPath = 0
    var rulers: [Ruler] = [Ruler(mainPhotoName: "MainPhoto0", coatOfArmsPhotoName: "CoatOfArms0", name: "Мари́я Фёдоровна", dynasty: "Вюртембергская"), Ruler(mainPhotoName: "MainPhoto1", coatOfArmsPhotoName: "CoatOfArms1", name: "Никола́й II Алекса́ндрович", dynasty: "Романовы"), Ruler(mainPhotoName: "MainPhoto2", coatOfArmsPhotoName: "CoatOfArms2", name: "Алекса́ндр III Алекса́ндрович", dynasty: "Романовы")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rulers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "Cell_ID", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = rulers[indexPath.row].name
        cell.dynastyLabel.text = rulers[indexPath.row].dynasty
        cell.mainImageView.image = UIImage(named: rulers[indexPath.row].mainPhotoName)
        cell.secondaryImageView.image = UIImage(named: rulers[indexPath.row].coatOfArmsPhotoName)
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondViewControllerSegue" {
            let secondViewController = segue.destination as? SecondViewController
            secondViewController?.transferNameLabelData = rulers[currentIndexPath].name
            secondViewController?.transferDynastyLabelData = rulers[currentIndexPath].dynasty
            secondViewController?.transferMainPhotoNameData = rulers[currentIndexPath].mainPhotoName
            secondViewController?.transferCoatOfArmsPhotoNameData = rulers[currentIndexPath].coatOfArmsPhotoName
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndexPath = indexPath.row
        performSegue(withIdentifier: "secondViewControllerSegue", sender: self)
    }
}
