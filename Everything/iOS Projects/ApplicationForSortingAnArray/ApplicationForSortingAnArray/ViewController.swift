import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var numberTableView: UITableView!
    
    var array = [10, 1, 3, 2, 6, 4, 5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private Methods
    func descendingSort(array: inout [Int]) {
        let arrayElements = array.count
        
        for _ in 0...arrayElements{
            for value in 1...arrayElements - 1 {
                if (array[value - 1] > array[value]) {
                    let tmp = array[value - 1]
                    array[value - 1] = array[value]
                    array[value] = tmp
                }
            }
        }
    }
    
    func ascendingSort(array: inout [Int]) {
        let arrayElements = array.count
        
        for _ in 0...arrayElements {
            for value in 1...arrayElements-1 {
                if (array[value-1] < array[value]) {
                    let tmp = array[value-1]
                    array[value-1] = array[value]
                    array[value] = tmp
                }
            }
        }
    }

    // MARK: Actions
    @IBAction func sortButton(_ sender: UIBarButtonItem) {
        print("You have pressed the sort button")
        descendingSort(array: &array)
//        ascendingSort(array: &array)
        print("The sorted array is: \(array)")
        self.numberTableView.reloadData()
    }
}

// MARK: TableViewDelegates
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "numberCellIdentifier"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellTableViewCell else {
            fatalError("The dequed isnot an instance of CellTableViewIdentifier")
        }
        
        // Fetch item
        let number = array[indexPath.row]
        
        // Configure cell
        cell.nameLabel.text = String(number)
        
        return cell
    }
}
