import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Moya = TargetDependency.external(name: "Moya")
    static let Needle = TargetDependency.external(name: "NeedleFoundation")
    static let NukeUI = TargetDependency.external(name: "NukeUI")
}

public extension Package {}
