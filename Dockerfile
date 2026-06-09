# Imagen base de Python optimizada
FROM python:3.11-slim

# Directorio de trabajo interno
WORKDIR /app

# Copiar e instalar dependencias primero para aprovechar la caché
COPY app/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código de la aplicación
COPY app/ .

# Crear el directorio donde se guardarán los logs para la persistencia
RUN mkdir -p /app/logs

# Exponer el puerto de Flask
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["python", "app.py"]
