FROM ghcr.io/ublue-os/bazzite:stable

# ── Herramientas de diagnóstico (no incluidas en Bazzite base) ────────────
# Nota: gamemode, mangohud y zram-generator YA vienen en Bazzite — no reinstalar
RUN rpm-ostree install \
        vulkan-tools \
        mesa-demos && \
    rpm-ostree cleanup -m && \
    ostree container commit || true

# ── Archivos de configuración del sistema ─────────────────────────────────
# Sobreescribe configs de Bazzite con los valores optimizados para hardware bajo
COPY config/files/takeos/ /

# ── Script de configuración inicial ──────────────────────────────────────
COPY scripts/takeos-setup.sh /tmp/takeos-setup.sh
RUN chmod +x /tmp/takeos-setup.sh && \
    /tmp/takeos-setup.sh && \
    rm -f /tmp/takeos-setup.sh && \
    ostree container commit || true
