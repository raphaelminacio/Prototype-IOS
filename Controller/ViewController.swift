
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuView: UIView!
    
    var tableData: [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.dataSource = self
//        
//        Data.getData { (data) in
//            self.tableData = data
//            self.tableView.reloadData()
//        }
        closeMenu()
    }
    
    @IBAction func menuTapped(_ sender: FloatActionButton) {
        UIView.animate(withDuration: 0.3, animations: {
            
       
        
            if self.menuView.transform == .identity {
                //menu when its open
                self.closeMenu()
            } else {
                self.menuView.transform = .identity
            }
        })
    }
    
    func closeMenu() {
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        cell.setup(model: tableData[indexPath.row])
        return cell
    }
}
