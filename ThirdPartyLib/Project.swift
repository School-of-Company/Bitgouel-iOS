import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramwork(
    name: "ThirdPartyLib",
    packages: [],
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
    dependencies: [
        .SPM.Moya,
        .SPM.NeedleFoundation
    ]
)
