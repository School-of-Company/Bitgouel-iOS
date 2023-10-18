if test -d "/opt/homebrew/bin/"; then
    PATH="/opt/homebrew/bin/:${PATH}"
fi

export PATH
YML="$(dirname "$0")/.swiftLint.yml"

if which swiftlint > /dev/null; then
    swiftlint --config "${YML}"
else
    echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
