import ProjectDescription

extension TargetDependency {
    public struct SPM {}
}

public extension TargetDependency.SPM {
    static let Swinject = TargetDependency.external(name: "Swinject")
}

public extension Package {
}
