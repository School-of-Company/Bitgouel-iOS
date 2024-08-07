import ConfigurationPlugin
import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(
                url: "https://github.com/Moya/Moya.git",
                requirement: .upToNextMajor(from: "15.0.3")
            ),
            .remote(
                url: "https://github.com/uber/needle.git",
                requirement: .upToNextMajor(from: "0.24.0")
            ),
            .remote(
                url: "https://github.com/kean/NukeUI.git",
                requirement: .upToNextMajor(from: "0.8.3")
            ),
            .remote(
                url: "https://github.com/kakao-mapsSDK/KakaoMapsSDK-SPM.git",
                requirement: .upToNextMinor(from: "2.10.5")
            )
        ],
        productTypes: [
            "KakaoMapsSDK-SPM": .staticLibrary
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: .dev),
                .debug(name: .stage),
                .release(name: .prod)
            ]
        )
    ),
    platforms: [.iOS]
)
