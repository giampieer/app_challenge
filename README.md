# APP CHALLENGE

## Installation

APP CHALLENGE requires [Flutter] v3.7.11 y version dart 2.19.4

```sh
cd app_challenge/
fvm use 3.7.7
fvm flutter pub get
```

## Production
For production (android) release:
```sh
fvm flutter build apk --release
fvm flutter build appbundle --release  --build-name=1.0.0  --build-number=1
```