import Foundation
import ProjectDescription

public struct ProjectEnvironment {
    public let name: String
    public let organizationName: String
    public let deploymentTarget: DeploymentTargets
    public let destination: Set<Destination>
    public let baseSetting: SettingsDictionary
}

public let env = ProjectEnvironment(
    name: "Bitgouel",
    organizationName: "team.msg",
    deploymentTarget: .iOS("15.0"),
    destination: .iOS,
    baseSetting: [:]
)
