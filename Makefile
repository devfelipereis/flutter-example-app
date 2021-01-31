prod:
	flutter build appbundle --dart-define=ENVFILE=.env.prod --target-platform android-arm,android-arm64,android-x64

prod\:split:
	flutter build apk --dart-define=ENVFILE=.env.prod --split-per-abi

dev:
	flutter build apk --split-per-abi --debug
