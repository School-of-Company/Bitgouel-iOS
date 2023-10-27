import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(
                url: "https://github.com/Swinject/Swinject.git",
                requirement: .upToNextMajor(from: "2.8.4")
            ),
            .remote(url: "https://github.com/Moya/Moya.git",
                    requirement: .upToNextMajor(from: "15.0.3")
                   )
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ]
        )
    ),
    platforms: [.iOS]
)
