import DI
import Foundation
import Benchmark

benchmark("Register 10_000") {
    for _ in 1...10_000 {
        DIManager.register((any MyProtocol).self) { _ in
          return MyImpl()
        }
    }
}

benchmark("Register 100_000") {
    for _ in 1...100_000 {
        DIManager.register((any MyProtocol).self) { _ in
          return MyImpl()
        }
    }
}

benchmark("Register 1_000_000") {
    for _ in 1...1_000_000 {
        DIManager.register((any MyProtocol).self) { _ in
          return MyImpl()
        }
    }
}

benchmark("Register 10_000_000") {
    for _ in 1...10_000_000 {
        DIManager.register((any MyProtocol).self) { _ in
          return MyImpl()
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
