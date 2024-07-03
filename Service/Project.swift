import ProjectDescription
import ProjectDescriptionHelpers
import EnvironmentPlugin

let configurations: [Configuration] = generateEnvironment == .ci ?
[
  .debug(name: .dev),
  .debug(name: .stage),
  .release(name: .prod)
] :
[
  .debug(name: .dev, xcconfig: .relativeToXCConfig(type: .dev, name: "Service")),
  .debug(name: .stage, xcconfig: .relativeToXCConfig(type: .stage, name: "Service")),
  .release(name: .prod, xcconfig: .relativeToXCConfig(type: .prod, name: "Service"))
]

let project = Project.dynamicFramwork(
    name: "Service",
    platform: .iOS,
    infoPlist: .extendingDefault(
        with: [
            "BASE_URL": "$(BASE_URL)"
        ]
    ),
    deploymentTarget: env.deploymentTarget,
    configurations: configurations,
    scripts: [.needle, .swiftLint]
)
