# 📘 Manual de Usuario - PassManager CLI

PassManager es una herramienta de línea de comandos (CLI) que permite gestionar contextos de conexión a servidores y conectarse a credenciales autorizadas centralizadas en un backend Odoo. Su enfoque es seguridad, modularidad y eficiencia.

---

## 📦 Instalación

### 🔧 Instalación desde ejecutable:
```bash
./install.sh
```
Esto instalará el ejecutable `passmanager` en `/usr/local/bin`.

### 🔥 Desinstalación:
```bash
./uninstall.sh
```

---

## ⚙️ Estructura de Contextos

Un **contexto** es una configuración de acceso al backend Odoo que controla el acceso a las credenciales de servidor. El usuario puede crear, editar, eliminar y activar contextos según necesidad.

Cada contexto contiene:
- Nombre (alias único)
- URL del endpoint Odoo
- Usuario
- Contraseña

---

## 🧠 Comandos disponibles

### 1️⃣ Agregar un nuevo contexto
```bash
passmanager add-context
```
Interactivo:
- Solicita nombre del contexto
- URL del backend Odoo
- Usuario
- Contraseña

### 2️⃣ Editar un contexto existente
```bash
passmanager update-context
```
- Muestra lista de contextos disponibles
- Permite editar URL/usuario/contraseña (mantiene valores si se deja vacío)

### 3️⃣ Eliminar un contexto
```bash
passmanager delete-context
```
- Muestra lista de contextos y confirma eliminación

### 4️⃣ Usar (activar) un contexto
```bash
passmanager use-context
```
- Selecciona cuál será el contexto activo (se usará en `connect`)

### 5️⃣ Ver contextos disponibles
```bash
passmanager list-contexts
```
- Lista todos los contextos, indicando cuál está activo actualmente

### 6️⃣ Conectarse a servidores del contexto activo
```bash
passmanager connect
```
- Se conecta al backend Odoo con las credenciales del contexto activo
- Recupera lista de credenciales autorizadas
- Permite seleccionar cliente → servidor
- Ejecuta conexión SSH o abre URL HTTP con credenciales visibles

#### Ejemplo de flujo completo:
```bash
$ passmanager connect
== Iniciar sesión en Odoo ==
Usuario: miusuario
Contraseña: ********
Seleccione cliente: [Openbit, Zedmex, Muebles Krill]
Seleccione servidor: [Zedmex v17 | 120.0.0.1]
> Si es SSH: abre terminal
> Si es HTTP: abre navegador y muestra credenciales
```

### 7️⃣ Caché local cifrada (opcional)
Al finalizar `connect`, puede optar por guardar credenciales localmente de forma cifrada (solo accesibles con contraseña propia del usuario):
```
¿Guardar caché local cifrada? (s/N): s
Contraseña para cifrar credenciales: ******
```

---

## 🔐 Seguridad
- Contextos se almacenan en `~/.passmanager/config.yaml`
- Historial de cambios se almacena en base64 en `context_history.log`
- Credenciales pueden guardarse cifradas localmente (`encrypted_credentials.bin`)
- Solo el backend Odoo decide qué accesos ver

---

## 📂 Ubicaciones de configuración
| Elemento                  | Ruta                              |
|--------------------------|-----------------------------------|
| Configuración principal  | `~/.passmanager/config.yaml`      |
| Historial de cambios     | `~/.passmanager/context_history.log` |
| Caché cifrada opcional   | `~/.passmanager/encrypted_credentials.bin` |

Puede cambiar el directorio raíz configurando la variable de entorno:
```bash
export PASSMANAGER_HOME=/ruta/personalizada
```

---

## 📞 Soporte
- Contacte al equipo de desarrollo interno para configurar su acceso a Odoo y autorización de servidores.
- Si pierde el contexto o la contraseña local, contacte a soporte TI para reconfigurar su entorno.

---

¡Gracias por usar PassManager!
