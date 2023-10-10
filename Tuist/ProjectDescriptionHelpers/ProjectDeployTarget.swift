import ProjectDescription

public enum ProjectDeployTarget: String {
    case debug = "DEBUG"
    case release = "RELEASE"
    
    public var configurationName: ConfigurationName {
        ConfigurationName.configuration(self.rawValue)
    }
}
