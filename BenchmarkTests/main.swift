import DI
import Foundation
import Benchmark

benchmark("Register 10_000") {
    DIManager.register(MyDep.self) { _ in
        return MyDep()
    }

    for _ in 1...10_000 {
        DIManager.register((any MyProtocol).self) { _ in
            let myDep = DIManager.resolve(MyDep.self)
            return MyImpl(
                depA: myDep,
                depB: myDep,
                depC: myDep,
                depD: myDep,
                depE: myDep,
                depF: myDep
            )
        }
    }
}

benchmark("Register 100_000") {
    for _ in 1...100_000 {
        DIManager.register((any MyProtocol).self) { _ in
            let myDep = DIManager.resolve(MyDep.self)
            return MyImpl(
                depA: myDep,
                depB: myDep,
                depC: myDep,
                depD: myDep,
                depE: myDep,
                depF: myDep
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
