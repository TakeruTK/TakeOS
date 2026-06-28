FROM ghcr.io/ublue-os/bazzite:stable

# ── Paquetes gaming ───────────────────────────────────────────────────────
RUN rpm-ostree install \
        zram-generator \
        gamemode \
        mangohud \
        vulkan-tools \
        mesa-demos && \
    rpm-ostree cleanup -m && \
    ostree container commit

# ── Archivos de configuración del sistema ─────────────────────────────────
COPY config/files/takeos/ /

# ── Script de configuración inicial ──────────────────────────────────────
COPY scripts/takeos-setup.sh /tmp/takeos-setup.sh
RUN chmod +x /tmp/takeos-setup.sh && \
    /tmp/takeos-setup.sh && \
    rm -f /tmp/takeos-setup.sh && \
    ostree container commit
