//
//  NewViewController.swift
//  IntroToRxSwift
//
//  Created by Samuel Maynard on 28/10/22.
//

import UIKit
import RxSwift
import RxCocoa

class NewViewController: UIViewController{
    let bag = DisposeBag()
    
    let allSymbols = ["RZW", "UDP", "MTT", "ZKQ", "IPK"]
    let allPrices = BehaviorRelay<[StockPrice]>(value: [])
    
    let prices = BehaviorRelay<[StockPrice]>(value: [])
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var favoritesSwitch: UISwitch!
    @IBOutlet var searchTerm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allPrices.accept(allSymbols.enumerated().map({ (index, symbol) -> StockPrice in
            return StockPrice(symbol: symbol, favorite: index % 2 == 0)
        }))
        prices.accept(allPrices.value)
        
    }
}

extension NewViewController {
    func bindUI () {
        Observable.combineLatest(
            allPrices.asObservable(),
            favoritesSwitch.rx.isOn,
            searchTerm.rx.text,
            resultSelector: { (currentPrices, onlyFavorites, search) in
//                print("\(currentPrices), \(onlyFavorites), \(String(describing: search))")
                return currentPrices.filter({ (price) -> Bool in
                    return true
                })
            }
        ).bind(to: prices )
    }
}

//extension NewViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return prices.value.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Stockcell") as! StockCell
//        let price = prices.value[indexPath.row]
//        cell.update(with: price)
//        return cell
//    }
//}
