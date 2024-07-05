import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Moya = TargetDependency.external(name: "Moya")
    static let Needle = TargetDependency.external(name: "NeedleFoundation")
}

public extension Package {}
