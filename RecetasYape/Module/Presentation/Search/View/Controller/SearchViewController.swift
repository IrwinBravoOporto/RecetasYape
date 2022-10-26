//
//  SearchViewController.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 22/10/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableViewFoodList: UITableView!
    @IBOutlet weak var searchController: UISearchBar!
    @IBOutlet weak var viewSearch: UIView!
    
    var presenter: SearchVCPresenterProtocol!
    let configurator = SearchVCConfigurator()
    
    var listFoodFilter: [Recipe]?
    
    
    private var valueTest = false
   

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        setupTablewView()
        setupSearchView()
        presenter.loadData()
        initBaseView()
        
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        view.backgroundColor = UIColor(hexString: "#272343")
    }

    func setupNavigation(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupSearchView() {
        searchController.delegate = self
        searchController.placeholder = "Search Foods"
        viewSearch.layer.cornerRadius = 10
    }
    
    func setupTablewView() {
        tableViewFoodList.register(UINib(nibName: FoodListCell.viewId, bundle: .main), forCellReuseIdentifier: FoodListCell.viewId)
        tableViewFoodList.separatorInset = .zero
        tableViewFoodList.separatorColor = .clear
    }
    
    private func headerView() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150))
        headerView.backgroundColor = .clear
        
        let label = UILabel(frame: CGRect(x: view.frame.size.width/4, y: 0, width: 200, height: headerView.frame.size.height))
        label.text = "No recipe found with that name"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .white
        headerView.addSubview(label)
        return headerView
    }
    
    func initBaseView(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SearchViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listFoodFilter?.count ?? Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodListCell.viewId, for: indexPath)
        
        if let cell = cell as? FoodListCell  {
            guard  let pubListArray = listFoodFilter?[indexPath.row] else {return UITableViewCell()}
            cell.setupData( data: pubListArray)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.goToFoodDetail(listFoodFilter?[indexPath.row] ?? Recipe())
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText == String()) {
            presenter.loadData()
            tableViewFoodList.tableHeaderView = nil
            tableViewFoodList.reloadData()
        } else {
            listFoodFilter?.removeAll()
            var value = false
            
            let arrayFilter = presenter.dataFoodList?.filter {
                
                let str = "\($0.name ?? String())"
                if let range: Range<String.Index> = str.range(of: "\(searchText)") {
                    let index: Int = str.distance(from: str.startIndex, to: range.lowerBound)
                    print(index)
                    value = true
                }
                else {
                    value = false
                }
                return value
            }
            tableViewFoodList.tableHeaderView = (arrayFilter?.count ?? Int() > 0) ? nil : headerView()
            listFoodFilter = arrayFilter
            tableViewFoodList.reloadData()
        }
    }
}

// MARK: - Unit Test
extension SearchViewController {

    func getCountListFood(newNalue : Int) -> Bool {
        let value = Constants.dataFood.dataRecipe.count
        valueTest = value == newNalue ? true : false
        return valueTest
    }
    
    func testUnitNumber(a: Int, b: Int) -> Int {
        return a + b
    }
}

