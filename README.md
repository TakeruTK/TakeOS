# TakeOS

**Gaming optimizado para el hardware que tienes, no para el que quisierías tener.**

TakeOS es una distribución Linux basada en [Bazzite](https://bazzite.gg) y [Fedora Atomic](https://fedoraproject.org/atomic-desktops/), diseñada específicamente para exprimir al máximo hardware de bajo presupuesto — notebooks viejos, PCs con GPU integrada, equipos con 4GB RAM.

Parte de [Industrias Take](https://github.com/TakeruTK) · Documentado en [TakeByte](https://youtube.com/@takebyte)

---

## ¿Qué incluye?

### Gaming nativo
- Steam + Proton preconfigurado (500+ juegos compatibles)
- Lutris (juegos fuera de Steam)
- Heroic Games Launcher (Epic Games Store y GOG gratuitos)
- Bottles (aplicaciones Windows)

### Emulación
- RetroDECK (todo en uno):
  - NES, SNES, Genesis, Game Boy, GBA
  - PlayStation 1 (DuckStation)
  - PlayStation 2 (PCSX2)
  - PSP (PPSSPP)
  - Nintendo DS / 3DS
  - GameCube y Wii (Dolphin)

### Optimizaciones para hardware bajo
- **zRAM** con compresión zstd — 4GB de RAM se comportan como ~6GB
- **GameMode** activo por defecto — optimiza CPU/GPU automáticamente al abrir un juego
- **MangoHud** preconfigurado — overlay de rendimiento siempre disponible
- Parámetros de kernel ajustados para GPU integrada (Intel HD / AMD Vega)

---

## Requisitos mínimos

| Componente | Mínimo |
|---|---|
| CPU | Intel Core 4ta gen (2013+) o AMD equivalente |
| RAM | 4 GB |
| Almacenamiento | 50 GB |
| GPU | Intel HD 4000+ o AMD APU (Vega 8/11) |

---

## Instalación

> **Estado actual: Alpha — en desarrollo activo**

```bash
# Desde Fedora Silverblue o Bazzite existente:
rpm-ostree rebase ostree-unverified-registry:ghcr.io/takebyte/takeos:latest
```

---

## Construir desde el codigo fuente

Este repositorio usa [BlueBuild](https://blue-build.dev/). Cada push al repo genera automaticamente una nueva imagen via GitHub Actions.

```bash
git clone https://github.com/TakeruTK/takeos
cd takeos
# Edita config/recipe.yml con tus cambios
git push  # GitHub Actions construye la imagen automaticamente
```

---

## Roadmap

- [x] Estructura base del repositorio
- [x] Configuracion zRAM y kernel params
- [x] RetroDECK + emuladores principales
- [x] GameMode + MangoHud
- [ ] Plymouth theme personalizado
- [ ] Deteccion automatica de hardware al primer arranque
- [ ] Perfiles de rendimiento (integrado vs dedicado)
- [ ] Sitio web oficial
- [ ] TakeOS 1.0 Release

---

## Seguir el desarrollo

El proceso completo de construccion de TakeOS se documenta en **TakeByte**:
- YouTube: [@takebyte](https://youtube.com/@takebyte)
- Instagram: [@take.byte](https://instagram.com/take.byte)

---

*TakeOS es un proyecto de [Industrias Take](https://github.com/TakeruTK)*  
*Basado en [Bazzite](https://bazzite.gg) y [Universal Blue](https://universal-blue.org)*
