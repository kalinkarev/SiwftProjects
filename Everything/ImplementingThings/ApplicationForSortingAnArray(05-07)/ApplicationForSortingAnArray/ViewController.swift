import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var numberTableView: UITableView!
    
    var array = [3, 10, 8, 9, 2, 5, 1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private Methods
//    func bubbleSort(_ input:[Int]) -> [Int] {
//        guard input.count > 1 else {
//            return input
//        }
//
//        var result = input
//        let count = result.count
//
//        var isSwapped = false
//
//        repeat {
//            isSwapped = false
//            for index in 1..<count {
//                if result[index] < result[index - 1] {
//                    result.swapAt(index - 1, index)
//                    isSwapped = true
//                }
//            }
//        } while isSwapped
//        return result
//    }

    func typeOfSorting( array: inout [Int]) {
        let arrayElements = array.count
        for index in 0...arrayElements {
            for value in 1...arrayElements-1 {
                if array[value-1] > array[value] {
                    let tmp = array[value-1]
                    array[value-1] = array[value]
                    array[value] = tmp
                }
            }
        }
    }
    
//    func newTypeOfSorting( array: inout [Int]) {
//        let arrayCount = array.count
//
//        for index in 0...arrayCount {
//            for value in 1...arrayCount-1 {
//                if array[value-1] > array[value] {
//                    let largeValue = array[value-1]
//                    array[value-1] = array[value]
//                    array[value] = largeValue
//                }
//            }
//        }
//    }

    // MARK: Actions
    @IBAction func sortButton(_ sender: UIBarButtonItem) {
        print("You have pressed the sort button")
//        array = bubbleSort(array)
//        newTypeOfSorting(array: &array)
        typeOfSorting(array: &array)
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
