#!/bin/bash
# ==========================================
# MODO BATERÍA (ahorro de energía)
# ==========================================

echo "🔋 Activando modo batería..."

# 1. TLP: perfil de batería - más agresivo en ahorro
sudo tlp bat

# 2. Gobernador de CPU en ahorro
echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor > /dev/null

# 3. Refresh rate del monitor a 60Hz (editando monitors.lua + reload, aplica al instante)
sed -i -E 's/(mode[[:space:]]*=[[:space:]]*")[^"]*(")/\11920x1080@60\2/' ~/.config/hypr/monitors.lua
hyprctl reload

# 4. Volver a AMD-only: comentar las líneas de Nvidia en ~/.config/uwsm/env
sed -i \
  -e 's/^export GBM_BACKEND=nvidia-drm/# export GBM_BACKEND=nvidia-drm/' \
  -e 's/^export __GLX_VENDOR_LIBRARY_NAME=nvidia/# export __GLX_VENDOR_LIBRARY_NAME=nvidia/' \
  -e 's/^export LIBVA_DRIVER_NAME=nvidia/# export LIBVA_DRIVER_NAME=nvidia/' \
  ~/.config/uwsm/env

echo "✅ TLP en BAT, CPU en powersave, 60Hz aplicado al instante."
echo "⚠️  El cambio de GPU (Nvidia deshabilitada) quedó guardado en ~/.config/uwsm/env,"
echo "    pero NO se aplica en caliente — necesitás cerrar sesión y volver a entrar"
echo "    (o reiniciar) para que tome efecto."
