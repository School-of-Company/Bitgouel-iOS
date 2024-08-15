// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
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
    )
#endif

let package = Package(
    name: "MyApp",
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.3")),
        .package(url: "https://github.com/uber/needle.git", .upToNextMajor(from: "0.24.0")),
        .package(url: "https://github.com/kean/NukeUI.git", .upToNextMajor(from: "0.8.3")),
        .package(url: "https://github.com/kakao-mapsSDK/KakaoMapsSDK-SPM.git", .upToNextMajor(from: "2.10.5"))
    ]
)
