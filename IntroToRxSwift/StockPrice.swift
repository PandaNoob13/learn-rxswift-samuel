//
//  StockPrice.swift
//  IntroToRxSwift
//
//  Created by Samuel Maynard on 28/10/22.
//

import RxSwift
import RxRelay

class StockPrice {
    public let symbol: String
    public var isFavorite: Bool = false
    
    private let price = BehaviorRelay<Double>(value: 0)
    var priceObservable: Observable<Double> {
        return price.asObservable()
    }
    
    init(symbol: String, favorite: Bool) {
        self.symbol = symbol
        self.isFavorite = favorite
    }
    
    func update (_ price: Double) {
        self.price.value = price
    }
}
