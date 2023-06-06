import Foundation

class MyImpl : MyProtocol {
    let depA: MyDep
    let depB: MyDep
    let depC: MyDep
    let depD: MyDep
    let depE: MyDep
    let depF: MyDep

    init(
        depA: MyDep,
        depB: MyDep,
        depC: MyDep,
        depD: MyDep,
        depE: MyDep,
        depF: MyDep
    ) {
        self.depA = depA
        self.depB = depB
        self.depC = depC
        self.depD = depD
        self.depE = depE
        self.depF = depF
    }

    func test() -> String {
        return "test"
    }
}
