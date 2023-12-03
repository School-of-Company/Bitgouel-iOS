import Foundation
import ProjectDescription

let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false

public extension Project {
    static func dynamicFramwork(
        name: String,
        platform: Platform = .iOS,
        packages: [Package] = [],
        infoPlist: InfoPlist = .default,
        deploymentTarget: DeploymentTarget,
        dependencies: [TargetDependency] = [
            .project(target: "ThirdPartyLib", path: Path("../ThirdPartyLib"))
        ],
        scripts: [TargetScript] = []
    ) -> Project {
        return Project(
            name: name,
            packages: packages,
            settings: .settings(
                base: .codeSign,
                configurations: isCI ?
                    [
                        .debug(name: .debug),
                        .release(name: .release)
                    ] :
                    [
                        .debug(
                            name: .debug,
                            xcconfig:
                            .relativeToXCConfig(type: .debug, name: name)
                        ),
                        .release(
                            name: .release,
                            xcconfig:
                            .relativeToXCConfig(type: .release, name: name)
                        )
                    ]
            ),
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: .framework,
                    bundleId: "\(publicOrganizationName).\(name)",
                    deploymentTarget: deploymentTarget,
                    infoPlist: infoPlist,
                    sources: ["Sources/**"],
                    scripts: [.SwiftLintString],
                    dependencies: dependencies
                )
            ]
        )
    }
}
