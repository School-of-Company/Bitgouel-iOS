import ProjectDescription

public extension Project {
    static func executable(
        name: String,
        platform: Platform,
        product: Product = .app,
        deploymentTarget: DeploymentTarget = .iOS(targetVersion: "15.0", devices: [.iphone]),
        dependencies: [TargetDependency],
        settings: Settings? = nil
    ) -> Project {
        return Project(
            name: name,
            organizationName: publicOrganizationName,
            settings: .settings(configurations: isCI ?
                                [
                                    .debug(name: .debug),
                                    .release(name: .release)
                                ] :
                               [
                                .debug(name: .debug, xcconfig:
                                        .relativeToXCConfig(type: .debug, name: name)),
                                .release(name: .release, xcconfig:
                                        .relativeToXCConfig(type: .debug, name: name))
                               ]),
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: product,
                    bundleId: "\(publicOrganizationName).\(name)",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .file(path: Path("Support/Info.plist")),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    scripts: [.SwiftLintString, .NeedleShell],
                    dependencies: [
                        .project(target: "ThirdPartyLib",
                                 path: Path("../ThirdPartyLib")),
                    ] + dependencies,
                    settings: settings
                ),
                Target(
                    name: "\(name)Test",
                    platform: platform,
                    product: .unitTests,
                    bundleId: "\(publicOrganizationName).\(name)Test",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .default,
                    sources: ["Tests/**"],
                    dependencies: [
                        .target(name: name)
                    ]
                )
            ]
        )
    }
}
