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
    .subscribe(onNext: { (value) -> Void in
        print(value)
    })

relay.accept(["Samuel", "Adhella"])
relay.accept(["Samuel", "Adhella", "Subalie"])
