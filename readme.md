```powershell
# Flipper Zero Official firmware
docker build `
    --build-arg firmware_repo=https://github.com/flipperdevices/flipperzero-firmware `
    --build-arg firmware_version=0.84.2 `
    -t bevir.io/f0-firmware:ofw-v0.84.2 --target final .

# Flipper Zero Unleashed
docker build `
    --build-arg firmware_repo=https://github.com/DarkFlippers/unleashed-firmware `
    --build-arg firmware_version=unlshd-052 `
    -t bevir.io/f0-firmware:unlshd-052 --target final .

# Flipper Zero Roguemaster
docker build `
    --build-arg firmware_repo=https://github.com/RogueMaster/flipperzero-firmware-wPlugins `
    --build-arg firmware_version=RM0607-1145-0.84.3-81c9df5 `
    -t bevir.io/f0-firmware:RM0607-1145-0.84.3-81c9df5 --target final .
```