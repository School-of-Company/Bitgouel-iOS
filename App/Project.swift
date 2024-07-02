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
  .debug(name: .dev, xcconfig: .relativeToXCConfig(type: .dev, name: "App")),
  .debug(name: .stage, xcconfig: .relativeToXCConfig(type: .stage, name: "App")),
  .release(name: .prod, xcconfig: .relativeToXCConfig(type: .prod, name: "App"))
]


let scripts: [TargetScript] = generateEnvironment == .dev ? [.needle, .swiftLint] : []

let project = Project.executable(
    name: env.name,
    product: .app,
    configurations: configurations,
    dependencies: [
        .project(target: "Service", path: "../Service")
    ],
    scripts: scripts
)
