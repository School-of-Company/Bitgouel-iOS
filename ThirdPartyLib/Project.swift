import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin
import EnvironmentPlugin

let project = Project.dynamicFramwork(
    name: "ThirdPartyLib",
    packages: [],
    deploymentTarget: env.deploymentTarget,
    dependencies: [
        .SPM.Moya,
        .SPM.Needle
    ]
)
