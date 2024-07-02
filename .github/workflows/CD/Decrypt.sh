# decrypt fastlane env file
gpg -d -o "$DECRYPTED_FASTLANE_ENV_PATH" --pinentry-mode=loopback --passphrase "$FASTLANE_SECRET" "$ENCRYPTED_FASTLANE_ENV_PATH"

# decrypt app store api key
gpg -d -o "$DECRYPTED_APPSTORE_CONNECT_PATH" --pinentry-mode=loopback --passphrase "$APPSTORE_CONNECT_SECRET" "$ENCRYPTED_APPSTORE_CONNECT_PATH"


# decrypt xcconfig
gpg -d -o "$DECRYPTED_XCCONFIG_PATH" --pinentry-mode=loopback --passphrase "$XCCONFIG_SECRET" "$ENCRYPTED_XCCONFIG_PATH"
unzip "$DECRYPTED_XCCONFIG_PATH"
rm -rf "$DECRYPTED_XCCONFIG_PATH"
