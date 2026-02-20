# Dotfiles

Archivos de configuración personales, gestionados con [GNU Stow](https://www.gnu.org/software/stow/).

## Estructura

```
dots/
├── bash/
│   ├── .bashrc
│   └── .bash_profile
├── tmux/
│   └── .tmux.conf
├── nvim/
│   └── .config/nvim/init.lua
└── ghostty/
    └── .config/ghostty/config
```

## Instalación

```bash
# Instalar stow
sudo dnf install -y stow

# Clonar el repo
git clone <url-del-repo> ~/Documents/development/personal/dots

# Activar todas las configs
cd ~/Documents/development/personal/dots
stow -t ~ bash tmux nvim ghostty
```

---

## Stow - Cheatsheet

| Comando | Descripción |
|---|---|
| `stow -t ~ <paquete>` | Crear symlinks de un paquete |
| `stow -t ~ -D <paquete>` | Eliminar symlinks de un paquete |
| `stow -t ~ -R <paquete>` | Recrear symlinks (eliminar + crear) |
| `stow -t ~ --adopt <paquete>` | Adoptar archivos existentes en HOME al repo |
| `stow -t ~ bash tmux nvim ghostty` | Activar varios paquetes a la vez |
| `stow -t ~ */` | Activar todos los paquetes |

> **Nota:** Todos los comandos se ejecutan desde el directorio raíz del repo (`dots/`).

### Agregar un programa nuevo

```bash
# 1. Crear la estructura (replica la ruta relativa a $HOME)
mkdir -p programa/.config/programa

# 2. Copiar o crear el config
cp ~/.config/programa/config.toml programa/.config/programa/

# 3. Activar con stow
stow -t ~ --adopt programa
```

---

## Bash - Cheatsheet

**Archivos:** `.bashrc`, `.bash_profile`

### Autocompletado

| Comportamiento | Descripción |
|---|---|
| `TAB` | Cicla entre opciones (menu-complete) |
| Case insensitive | Ignora mayúsculas/minúsculas |
| Colores | Stats y prefijos coloreados |
| Symlinks marcados | Directorios con `/` al final |

### PATH y herramientas

| Variable | Valor |
|---|---|
| `~/.local/bin` y `~/bin` | Agregados al PATH |
| fnm | Node.js version manager (`~/.local/share/fnm`) |
| Go | `$GOPATH` en `~/go`, binarios en `$GOPATH/bin` |

### Extensiones

Cualquier archivo en `~/.bashrc.d/` se carga automáticamente.

---

## Tmux - Cheatsheet

**Archivo:** `.tmux.conf`

**Prefijo:** `Ctrl+a` (en lugar del default `Ctrl+b`)

### Sesiones y ventanas

| Atajo | Acción |
|---|---|
| `prefix + c` | Nueva ventana (en directorio actual) |
| `prefix + r` | Recargar configuración |
| `Shift + ←/→` | Cambiar ventana (sin prefijo) |

### Paneles

| Atajo | Acción |
|---|---|
| `prefix + \|` | Split vertical |
| `prefix + -` | Split horizontal |
| `Alt + ←/→/↑/↓` | Navegar entre paneles (sin prefijo) |
| `prefix + Ctrl + ←/→/↑/↓` | Redimensionar paneles |

### Copiar (modo vi)

| Atajo | Acción |
|---|---|
| `prefix + [` | Entrar a modo copia |
| `v` | Iniciar selección |
| `y` | Copiar selección |
| `q` | Salir del modo copia |

### Otras opciones

- Mouse habilitado (scroll, click, resize)
- Ventanas inician en 1 (no en 0)
- Historial: 10,000 líneas
- Sin delay al presionar Esc

---

## Ghostty - Cheatsheet

**Archivo:** `.config/ghostty/config`

### Cursor

- Estilo: bloque (`cursor-style = block`)

### Splits

| Atajo | Acción |
|---|---|
| `Ctrl+Shift+e` | Split vertical (derecha) |
| `Ctrl+Shift+o` | Split horizontal (abajo) |
| `Ctrl+Alt+h/l/k/j` | Navegar entre splits |

---

## Neovim - Cheatsheet

**Archivo:** `.config/nvim/init.lua`

**Leader:** `Space`

### Navegación

| Atajo | Acción |
|---|---|
| `Ctrl + h/j/k/l` | Moverse entre splits |
| `Ctrl + d/u` | Scroll medio (centrado) |
| `n / N` | Siguiente/anterior búsqueda (centrado) |
| `Ctrl + a` | Seleccionar todo |

### Edición

| Atajo | Acción |
|---|---|
| `V` + `J/K` | Mover líneas seleccionadas arriba/abajo |
| `leader + p` | Pegar sin perder el registro (modo visual) |
| `Esc` | Limpiar resaltado de búsqueda |

### Archivos

| Atajo | Acción |
|---|---|
| `leader + e` | Explorador de archivos (netrw) |
| `leader + w` | Guardar archivo |
| `leader + q` | Cerrar |

### Splits

| Atajo | Acción |
|---|---|
| `Ctrl + ↑/↓` | Redimensionar horizontal |
| `Ctrl + ←/→` | Redimensionar vertical |

### Opciones activas

- Números relativos
- Indentación: 4 espacios
- Búsqueda case-insensitive (smart case)
- Clipboard del sistema
- Undo persistente (se mantiene entre sesiones)
- Columna guía en 80
- Trailing whitespace se elimina al guardar
- Cursor restaurado al reabrir archivos
- Highlight al hacer yank
