generate:
	mise exec -- tuist install
	mise exec -- tuist generate

ci_generate:
	mise exec -- tuist install
	TUIST_ENV=CI mise exec -- tuist generate

cd_generate:
	mise exec -- tuist install
	TUIST_ENV=CD mise exec -- tuist generate

clean:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

reset:
	mise exec -- tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace
