import EnvironmentPlugin
import ProjectDescription

public extension Project {
    static func executable(
        name: String,
        destination: Set<Destination> = env.destination,
        product: Product,
        packages: [Package] = [],
        settings: Settings? = nil,
        configurations: [Configuration] = [],
        dependencies: [TargetDependency],
        scripts: [TargetScript]
    ) -> Project {
        let scripts: [TargetScript] = generateEnvironment.scripts

        var configurations = configurations
        if configurations.isEmpty {
            configurations = .default
        }

        var settings: Settings = .settings(
            base: env.baseSetting,
            configurations: configurations,
            defaultSettings: .recommended
        )

        let schemes: [Scheme] = [
            .scheme(
                name: "\(env.name)-DEV",
                shared: true,
                buildAction: .buildAction(targets: ["\(env.name)"]),
                runAction: .runAction(configuration: .dev),
                archiveAction: .archiveAction(configuration: .dev),
                profileAction: .profileAction(configuration: .dev),
                analyzeAction: .analyzeAction(configuration: .dev)
            ),
            .scheme(
                name: "\(env.name)-STAGE",
                shared: true,
                buildAction: .buildAction(targets: ["\(env.name)"]),
                runAction: .runAction(configuration: .stage),
                archiveAction: .archiveAction(configuration: .stage),
                profileAction: .profileAction(configuration: .stage),
                analyzeAction: .analyzeAction(configuration: .stage)
            ),
            .scheme(
                name: "\(env.name)-PROD",
                shared: true,
                buildAction: .buildAction(targets: ["\(env.name)"]),
                runAction: .runAction(configuration: .prod),
                archiveAction: .archiveAction(configuration: .prod),
                profileAction: .profileAction(configuration: .prod),
                analyzeAction: .analyzeAction(configuration: .prod)
            )
        ]

        return Project(
            name: name,
            organizationName: env.organizationName,
            packages: packages,
            settings: settings,
            targets: [
                .target(
                    name: name,
                    destinations: destination,
                    product: product,
                    bundleId: "\(env.organizationName).\(name)",
                    deploymentTargets: env.deploymentTarget,
                    infoPlist: .file(path: Path("Support/Info.plist")),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    scripts: scripts,
                    dependencies: [
                        .project(
                            target: "ThirdPartyLib",
                            path: Path("../ThirdPartyLib"),
                            condition: .when(.all)
                        ),
                    ] + dependencies,
                    settings: settings
                ),
                .target(
                    name: "\(name)Test",
                    destinations: destination,
                    product: .unitTests,
                    bundleId: "\(env.organizationName).\(name)Test",
                    deploymentTargets: env.deploymentTarget,
                    infoPlist: .default,
                    sources: ["Tests/**"],
                    dependencies: [
                        .target(name: name, condition: .when(.all))
                    ]
                )
            ],
            schemes: schemes
        )
    }
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return .scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}
