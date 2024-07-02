import ProjectDescription
import ProjectDescriptionHelpers
import EnvironmentPlugin

let project = Project.dynamicFramwork(
    name: "Service",
    platform: .iOS,
    infoPlist: .extendingDefault(
        with: [
            "BASE_URL": "$(BASE_URL)"
        ]
    ),
    deploymentTarget: env.deploymentTarget,
    scripts: [.needle]
)
