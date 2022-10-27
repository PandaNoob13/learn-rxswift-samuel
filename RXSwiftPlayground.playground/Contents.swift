import UIKit
import PlaygroundSupport

import RxSwift
let names = BehaviorSubject(value: ["peter"])
print(try names.value())
