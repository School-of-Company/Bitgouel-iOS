import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramwork(
    name: "Service",
    platform: .iOS,
    infoPlist: .extendingDefault(
        with: [
            "BASE_URL": "$(BASE_URL)"
        ]
    ),
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
    scripts: [.SwiftLintShell, .NeedleShell]
)
