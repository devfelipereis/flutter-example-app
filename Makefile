prod:
	flutter build appbundle --dart-define=ENVFILE=.env.prod --target-platform android-arm,android-arm64,android-x64

prod\:split:
	fvm flutter build apk --dart-define=ENVFILE=.env.prod --split-per-abi --no-sound-null-safety

dev:
	fvm flutter build apk --split-per-abi --debug --no-sound-null-safety
