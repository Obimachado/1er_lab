# SOC01 - Laboratorio Wazuh + web01

Este repositorio contiene scripts utilizados en un entorno de laboratorio SOC con Wazuh Manager 4.7, web01 como agente, y simulación de ataques para análisis.

## 📁 Contenido

### `/scripts/`
- `simular_ataques_web01.sh`: Simula ataques de red y de sistema comunes.
- `install_wazuh_module.sh`: Instala manualmente el módulo Wazuh para Filebeat.
- `reset_dashboard_passwords.sh`: Recupera o cambia contraseñas del dashboard Kibana/Wazuh.
- `change_admin_password_wazuh_api.sh`: Cambia la contraseña del usuario 'admin' usando la API de Wazuh.

## 🚀 Uso rápido

```bash
chmod +x script.sh
sudo ./script.sh
```

## 🛠 Requisitos

- Ubuntu Server 22.04
- Wazuh Manager 4.7
- Filebeat 7.10.2
- Elasticsearch y Kibana 7.10.2
