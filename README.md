# Monitor de IPv6 y Notificación por Telegram

Este proyecto consta de dos scripts en Bash diseñados para obtener la dirección IPv6 pública actual del servidor y enviarla automáticamente a un chat de Telegram.

## 📂 Estructura del Proyecto

* `averiguate-la-ip.sh`: Script principal. Detecta la IPv6 pública activa, la guarda en un archivo local y ejecuta el script de envío.
* `enviar_datos.sh`: Lee la IP guardada y la envía mediante la API de Telegram usando el formato HTML.
* `config.env`: Archivo de configuración (no incluido en el repositorio) donde se guardan las credenciales del bot.
* `mi_ipv6.txt`: Archivo temporal generado automáticamente que almacena la última IPv6 detectada.

## ⚙️ Configuración

1. Crea un archivo llamado `config.env` en la misma carpeta que los scripts.
2. Agrega el token de tu bot y el ID de tu chat con el siguiente formato:

```env
TOKEN="tu_token_de_telegram"
CHAT_ID="tu_chat_id"
```

3. Otorga permisos de ejecución a los scripts:

```bash
chmod +x averiguate-la-ip.sh enviar_datos.sh
```

## 🚀 Uso

Para ejecutar el proceso manualmente:

```bash
./averiguate-la-ip.sh
```

### ¿Cómo funciona?
1. Busca la primera dirección IPv6 global no obsoleta (`-deprecated`) en las interfaces de red.
2. Si encuentra una IP válida, la escribe en `mi_ipv6.txt` y llama a `enviar_datos.sh`.
3. `enviar_datos.sh` carga las variables de `config.env` y envía el mensaje a Telegram mostrando el nombre del equipo (`hostname`) y la IPv6.
4. Si no detecta ninguna IPv6 pública, elimina el archivo `mi_ipv6.txt` y termina con un error.


