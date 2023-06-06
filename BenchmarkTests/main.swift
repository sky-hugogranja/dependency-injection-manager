import DI
import Foundation
import Benchmark

benchmark("Register 10_000") {
    DIManager.register(MyDep.self) { _ in
        return MyDep()
    }

    for _ in 1...10_000 {
        DIManager.register((any MyProtocol).self) { _ in
            let myDepA = DIManager.resolve(MyDep.self)
            let myDepB = DIManager.resolve(MyDep.self)
            let myDepC = DIManager.resolve(MyDep.self)
            let myDepD = DIManager.resolve(MyDep.self)
            let myDepE = DIManager.resolve(MyDep.self)
            let myDepF = DIManager.resolve(MyDep.self)

            return MyImpl(
                depA: myDepA,
                depB: myDepB,
                depC: myDepC,
                depD: myDepD,
                depE: myDepE,
                depF: myDepF
            )
        }
    }
}

benchmark("Register 100_000") {
    for _ in 1...100_000 {
        DIManager.register((any MyProtocol).self) { _ in
            let myDepA = DIManager.resolve(MyDep.self)
            let myDepB = DIManager.resolve(MyDep.self)
            let myDepC = DIManager.resolve(MyDep.self)
            let myDepD = DIManager.resolve(MyDep.self)
            let myDepE = DIManager.resolve(MyDep.self)
            let myDepF = DIManager.resolve(MyDep.self)

            return MyImpl(
                depA: myDepA,
                depB: myDepB,
                depC: myDepC,
                depD: myDepD,
                depE: myDepE,
                depF: myDepF
            )
        }
    }
}

let settings: [BenchmarkSetting] = [
    MaxIterations(1_000_000),
    MinTime(seconds: 1.0),
    TimeUnit(.ms),
    InverseTimeUnit(.s),
    Format(.console),
    Quiet(false),
]

Benchmark.main(settings: settings)
