import DependencyPlugin
import EnvironmentPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramwork(
    name: "ThirdPartyLib",
    packages: [],
    deploymentTarget: env.deploymentTarget,
    dependencies: [
        .SPM.Moya,
        .SPM.Needle
    ]
)
