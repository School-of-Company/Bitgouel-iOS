import EnvironmentPlugin
import Foundation
import ProjectDescription

let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false

public extension Project {
    static func dynamicFramwork(
        name: String,
        platform: Platform = env.platform,
        packages: [Package] = [],
        infoPlist: InfoPlist = .default,
        deploymentTarget: DeploymentTarget,
        configurations: [Configuration] = [],
        dependencies: [TargetDependency] = [
            .project(target: "ThirdPartyLib", path: Path("../ThirdPartyLib"))
        ],
        scripts: [TargetScript] = []
    ) -> Project {
        var configurations = configurations
        if configurations.isEmpty {
            configurations = .default
        }

        return Project(
            name: name,
            packages: packages,
            settings: .settings(
                base: env.baseSetting,
                configurations: configurations,
                defaultSettings: .recommended
            ),
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: .framework,
                    bundleId: "\(env.organizationName).\(name)",
                    deploymentTarget: env.deploymentTarget,
                    infoPlist: infoPlist,
                    sources: ["Sources/**"],
                    scripts: [.swiftLint],
                    dependencies: dependencies
                )
            ]
        )
    }
}
