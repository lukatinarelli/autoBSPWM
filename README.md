# autoBSPWM [En Proceso]

¡Bienvenido a **autoBSPWM**!  
Script para instalar y configurar automáticamente un entorno de trabajo completo y moderno en **Ubuntu** (y derivados), basado en [BSPWM](https://github.com/baskerville/bspwm), [Polybar](https://github.com/polybar/polybar), [sxhkd](https://github.com/baskerville/sxhkd) y más herramientas útiles para tu día a día.

## ¿Qué es autoBSPWM?

autoBSPWM transforma tu sistema en un espacio productivo, rápido y estético, sin complicaciones manuales.

Inspirado en [AutoBspwm de ZLCube](https://github.com/ZLCube/AutoBspwm), pero orientado a **Ubuntu** y uso general. Aquí el foco está en la productividad y comodidad para trabajar.

## Características principales

Instala y configura, de forma automática:

- **BSPWM**: gestor de ventanas minimalista y rápido.
- **Polybar personalizada**, con módulos para:
  - IP pública.
  - VPN: botón para encender/apagar.
  - Escritorios: cambio rápido.
  - Spotify: muestra la canción actual y controles básicos.
  - Volumen: ruedita del ratón, mute y configuración.
  - Batería.
  - Bluetooth y WiFi: acciones rápidas (apagar/abrir config).
  - Apagar, reiniciar y bloquear sistema.
- **Menú de temas personalizados**:
  - El script incluye un menú interactivo donde puedes elegir entre varios **temas visuales** exclusivos, cada uno con su propio wallpaper y configuración de Polybar.
  - El **tema por defecto** es el de **S4vitar**, con su característico estilo y fondo.
- **i3lock-color**: bloqueo de pantalla estilizado.
- **SDDM**: gestor de inicio de sesión visual.
- **sxhkd**: atajos de teclado personalizados.
- **Kitty**: terminal avanzada.
- **Zsh** y **Powerlevel10k**: shell potente y personalizable, con fuente NerdFonts.
- **eog (Eye of GNOME)**: visor de imágenes.
- **Picom**: compositor para transparencias y ventanas redondeadas.
- **Configuración multi-monitor**: por defecto para 2 monitores.
- **Instalación de programas útiles**:
  - Obsidian, VSCode, Spotify, KeePassXC.

Todo el entorno está **configurado en español** por defecto.

## Requisitos

- Ubuntu 22.04/24.04 (probado en versiones recientes, puede funcionar en derivados).
- Conexión a internet.
- Permisos de sudo.

## Instalación

```bash
git clone https://github.com/lukatinarelli/autoBSPWM.git
cd autoBSPWM
chmod +x autoBSPWM.sh
./autoBSPWM.sh
```

> El script guía paso a paso y permite elegir qué componentes instalar y tu tema visual preferido.

## Menú de temas

Al iniciar el script, tendrás un **menú interactivo** para elegir entre diferentes temas visuales, cada uno con su propio wallpaper y configuración de Polybar.  
El **tema por defecto** es el de **S4vitar**, ideal si te gusta la estética hacking y minimalista.

## Capturas de pantalla

*Aquí puedes añadir imágenes del entorno, Polybar, SDDM, menú de temas, etc.*

## Atajos de teclado (sxhkd)

Algunos de los atajos más importantes incluidos:

| Atajo                     | Acción                                 |
|---------------------------|----------------------------------------|
| `Super + Enter`           | Abrir terminal (Kitty)                 |
| `Super + D`               | Lanzador de aplicaciones (rofi/dmenu)  |
| `Super + W`               | Cerrar ventana                         |
| `Super + F`               | Maximizar ventana                      |
| `Super + T`               | Volver ventana por defeto              |
| `Super + S`               | Dejat ventana libre                    |
| `Super + 1...0`           | Cambiar a escritorio 1-10              |
| `Super + Shift + 1...0`   | Mover ventana a escritorio 1-10        |
| `Super + L`               | Bloquear pantalla (i3lock-color)       |
| `Super + flechas`         | Moverte entre ventanas                 |
| `Super + Alt + flechas`   | Cambiar tamaño ventanas                |
| `Super + Shift + flechas` | Cambiar orden ventanas                 |
| `Super + Shift + f`       | Abir firefox                           |
| `Super + Shift + f`       | Abir google chrome                     |

> La tecla `Super` es la tecla **win**

## Créditos

- Basado en el trabajo original de [ZLCube](https://github.com/ZLCube/AutoBspwm).
- Tema por defecto y parte de la inspiración visual gracias a [S4vitar](https://github.com/S4vitar).
- Gracias a los desarrolladores de BSPWM, Polybar, sxhkd y demás herramientas open source.

---

> ¿Dudas, sugerencias o ideas? ¡Abre un issue o contacta conmigo!











programas:
- bspwm
- zsh
- polybar
- p10k
- eog
- kitty
- githubs:

AutoBspwm:
- i3lock-color
- picom
- polybar
- rofi-themes-collection
- lightdm-webkit2-greeter





capturas... caputars themes.sh...
pensado para ubuntu
teclas

- [x] instalar i3
- [x] instalar themes de rofi
- [x] configurar el i3lock-color
- [x] instalación paquetes
- [x] i3lock-color
- [ ] instalar vscode
- [ ] selector themes
- [ ] SDDM
- [x] spotify get
- [ ] ips y vpn
- [ ] monitores
- [x] discos usb y externos
- [x] (wifi, audio, blueman...)
- [ ] configuración monitores
- [ ] notificaciones?
- [ ] configuración vpn?
