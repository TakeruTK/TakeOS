#!/usr/bin/env bash
# TakeOS — Script de configuracion inicial
# Se ejecuta una sola vez durante el build de la imagen

set -euo pipefail

echo ">>> TakeOS: Aplicando configuracion inicial..."

# ── Habilitar GameMode como servicio del sistema ──────────────────────────
systemctl enable gamemoded || true

# ── Configurar MangoHud por defecto para todos los usuarios ──────────────
mkdir -p /etc/MangoHud
cat > /etc/MangoHud/MangoHud.conf << 'EOF'
# TakeOS - MangoHud config por defecto
# Muestra FPS, uso de GPU, RAM y CPU
fps
gpu_stats
gpu_temp
ram
cpu_stats
cpu_temp
position=top-left
font_size=20
background_alpha=0.5
EOF

# ── Habilitar zRAM ────────────────────────────────────────────────────────
systemctl enable systemd-zram-setup@zram0.service || true

# ── Configurar GameMode (agnostico de GPU — funciona en Intel y AMD) ──────
mkdir -p /etc/gamemode.ini.d
cat > /etc/gamemode.ini.d/takeos.ini << 'EOF'
[general]
renice = 10

[cpu]
pin_cores = yes

[gpu]
apply_gpu_optimisations = accept-responsibility
gpu_device = 0
EOF

# ── Mensaje de bienvenida en terminal ────────────────────────────────────
cat > /etc/profile.d/takeos-welcome.sh << 'EOF'
if [ "$TERM" != "dumb" ]; then
    echo ""
    echo "  Bienvenido a TakeOS - Gaming para el hardware que tienes"
    echo "  github.com/TakeruTK/TakeOS"
    echo ""
fi
EOF

echo ">>> TakeOS: Configuracion completada."
