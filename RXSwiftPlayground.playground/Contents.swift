import UIKit
import PlaygroundSupport
import RxSwift
import RxRelay

let names = BehaviorSubject(value: ["Dwayne"])
let relay = BehaviorRelay(value: ["Samuel"])

let bag = DisposeBag()
//print(try names.value())

//names.asObservable()
//    .subscribe(onNext: { (value) -> Void in
//        print(value)
//    }).disposed(by: bag)

relay.asObservable()
    .throttle(DispatchTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
    .filter({ (value) -> Bool in
        return value == ["Samuel"]
    })
    .map({ (value) -> String in
        return "Users: \(value)"
    })
    .subscribe(onNext: { (value) -> Void in
        print(value)
    })

relay.accept(["Samuel", "Dwaynes"])
relay.accept(["Samuel", "Dwayne", "Johnson"])

