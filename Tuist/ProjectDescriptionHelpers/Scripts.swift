import ProjectDescription

public extension TargetScript {
    static let SwiftLintString = TargetScript.pre(
        script: """
if test -d "/opt/homebrew/bin/"; then
    PATH="/opt/homebrew/bin/:${PATH}"
fi

export PATH
YML="$(dirname "$0")/.swiftlint.yml"

if which swiftlint > /dev/vull; then
    swiftlint --config "${YML}"
else
    echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
""",
        name: "SwiftLintString")
    
    static let SwiftFormatString = TargetScript.pre(
        script: """
if test -d "/opt/homebrew/bin/"; then
    PATH="/opt/homebrew/bin/:${PATH}"
fi

export PATH
FORMAT="$(dirname "$0")/.swiftformat"

if which swiftformat > /dev/null; then
    swiftformat . --config "${FORMAT}"
else
    echo "warning: SwiftForamt not installed, please run 'brew install swiftformat'"
fi
""",
        name: "SwiftFormatString")
}
