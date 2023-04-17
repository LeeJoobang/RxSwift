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

/*
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

*/

//let strikes = PublishSubject<String>()
//let disposebag = DisposeBag()
//strikes.elementAt(2)
//    .subscribe(onNext: { _ in
//        print("You are out")
//    }).disposed(by: disposebag)
//
//strikes.onNext("x")
//strikes.onNext("x")
//strikes.onNext("x")


//let disposeBag = DisposeBag()
//let observable = Observable.of(1, 2, 3, 4, 5, 6)
//
//observable
//    .skip(4)
//    .subscribe(onNext: { element in
//        print("Next:", element)
//    }, onError: { error in
//        print("Error:", error)
//    }, onCompleted: {
//        print("Completed")
//    })
//    .disposed(by: disposeBag)


//let disposeBag = DisposeBag()
//let observable = Observable.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
//
//observable
//    .skipWhile { $0 < 5 } // 5 미만의 요소를 건너뛰는 조건입니다.
//    .subscribe(onNext: { element in
//        print("Skipped while the element is less than 5:", element)
//    }, onCompleted: {
//        print("Completed")
//    })
//    .disposed(by: disposeBag)

//let disposeBag = DisposeBag()
//let observable = PublishSubject<String>()
//let trigger = PublishSubject<Void>()
//
//observable
//    .skip(until: trigger)
//    .subscribe(onNext: { element in
//        print("Skipped until trigger fired:", element)
//    }, onCompleted: {
//        print("Completed")
//    })
//    .disposed(by: disposeBag)
//
//observable.onNext("A")
//observable.onNext("B")
//trigger.onNext(())
//observable.onNext("C")
//observable.onNext("D")


//let disposeBag = DisposeBag()
//let observable = Observable.of("A", "B", "C", "D", "E")
//
//observable
//    .take(3) // 처음 3개의 요소만 포함하는 시퀀스를 생성합니다.
//    .subscribe(onNext: { element in
//        print("Took first 3 elements:", element)
//    }, onCompleted: {
//        print("Completed")
//    })
//    .disposed(by: disposeBag)


//let disposeBag = DisposeBag()
//let observable = Observable.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
//
//observable
//    .takeWhile { $0 < 5 } // 조건이 참인 동안의 요소만 포함하는 시퀀스를 생성합니다.
//    .subscribe(onNext: { element in
//        print("Taking while element is less than 5:", element)
//    }, onCompleted: {
//        print("Completed")
//    })
//    .disposed(by: disposeBag)

//let disposeBag = DisposeBag()
//let observable = PublishSubject<String>()
//let trigger = PublishSubject<Void>()
//
//observable
//    .take(until: trigger)
//    .subscribe(onNext: { element in
//        print("Skipped until trigger fired:", element)
//    }, onCompleted: {
//        print("Completed")
//    })
//    .disposed(by: disposeBag)
//
//observable.onNext("A")
//observable.onNext("B")
//trigger.onNext(())
//observable.onNext("C")
//observable.onNext("D")


//let disposebag = DisposeBag()
//let observable = Observable.of(1, 2, 3, 4, 5)
//
//observable.map { event in
//    return event * 2
//}.subscribe { event in
//    print(event)
//}.disposed(by: disposebag)


//let disposebag = DisposeBag()
//
//struct Student {
//    var score: BehaviorRelay<Int>
//
//}
//
//let john = Student(score: BehaviorRelay(value: 75))
//let mary = Student(score: BehaviorRelay(value: 93))
//
//let student = PublishSubject<Student>()
//
//student.asObservable()
//    .flatMap { $0.score.asObservable() }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposebag)
//
//student.onNext(john)
//student.onNext(mary)
//
//john.score.accept(100)
//mary.score.accept(43 )
//
//let disposeBag = DisposeBag()
//
//let numbers = PublishSubject<Int>()

// flatMap example
//numbers
//    .flatMap { number -> Observable<String> in
//        print("flatMap: Number: \(number)")
//        return Observable<String>
//            .just("String: \(number)")
//            .delay(.milliseconds(100 * number), scheduler: MainScheduler.instance)
//    }
//    .subscribe(onNext: { string in
//        print("flatMap: \(string)")
//    })
//    .disposed(by: disposeBag)

// flatMapLatest example
//numbers
//    .flatMapLatest { number -> Observable<String> in
//        print("flatMapLatest: Number: \(number)")
//        return Observable<String>
//            .just("String: \(number)")
//            .delay(.milliseconds(100 * number), scheduler: MainScheduler.instance)
//    }
//    .subscribe(onNext: { string in
//        print("flatMapLatest: \(string)")
//    })
//    .disposed(by: disposeBag)
//
//// Emit numbers
//numbers.onNext(1)
//numbers.onNext(2)
//numbers.onNext(3)

// flatMap output:
// flatMap: Number: 1
// flatMap: Number: 2
// flatMap: Number: 3
// flatMap: String: 1
// flatMap: String: 3
// flatMap: String: 2

// flatMapLatest output:
// flatMapLatest: Number: 1
// flatMapLatest: Number: 2
// flatMapLatest: Number: 3
// flatMapLatest: String: 3

//let disposebag = DisposeBag()
//
//let first = Observable.of(1, 2, 3)
//let second = Observable.of(4, 5, 6)
//
//
//first.concat(second)
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposebag)

let disposebag = DisposeBag()

let source = Observable.of(1, 2, 3)

source.reduce(0, accumulator: -)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposebag)
