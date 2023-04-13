import UIKit
import RxSwift
import RxCocoa

// 관측 가능한 것을 만들었음.
/*
let observable1 = Observable.just(1)
let observable2 = Observable.of(1, 2, 3)
let observable3 = Observable.of([1, 2, 3])
let observable4 = Observable.from([1, 2, 3, 4, 5])

observable4.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

observable3.subscribe { event in
    if let element = event.element {
        print(element)
    }
}


observable4.subscribe(onNext: { evnet in
    print(evnet)
})
 
 */

/*
let disposebag = DisposeBag()
Observable.of("a", "b", "c")
    .subscribe {
        print($0)
    }.disposed(by: disposebag)
// subscribe를 처리한 후에 disposed를 처리한다.

Observable<String>.create { observer in
    observer.onNext("a")
    observer.onCompleted()
    observer.onNext("?")
    return Disposables.create()
}.subscribe(onNext: { print($0) }, onError: { print($0) }, onCompleted: { print("Completed") }, onDisposed: {print("Disposed")}
).disposed(by: disposebag)
*/


let disposeBag = DisposeBag()

let relay = BehaviorRelay(value: ["item1"])
var value = relay.value
value.append("item 2")
value.append("item 3")

relay.accept(value)

relay.asObservable()
    .subscribe{
        print($0)
    }

