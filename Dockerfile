# Étape 1 : Utiliser une image officielle Python
FROM python:3.9-slim

# Étape 2 : Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Étape 3 : Copier les fichiers du projet dans le conteneur
COPY . .

# Étape 4 : Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Étape 5 : Exposer le port utilisé par Flask
EXPOSE 5000

# Étape 6 : Démarrer l’application Flask
CMD ["python", "app.py"]
#Use an official python image
FROM python:3.9-slim

#Set work directory
WORKDIR /app

#Copy app files
COPY . .

#Install Flask
RUN pip install Flask

#Run the app
CMD ["python", "app.py"]
