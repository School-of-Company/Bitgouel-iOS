import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.executable(
    name: "Bitgouel",
    platform: .iOS,
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
    dependencies: [
        .project(target: "Service", path: "../Service")
    ]
)
