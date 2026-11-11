# ADN CONNECT — Fondations techniques v1

Ce dépôt contient le socle initial du projet ADN CONNECT. Il s'agit d'une base de développement, pas encore d'une application prête à être publiée.

## Contenu
- API backend NestJS avec endpoint de contrôle de santé.
- Configuration locale Docker Compose : PostgreSQL, Redis et MinIO.
- Schéma SQL initial et données de référence pour le Bénin.
- Documentation d'architecture, feuille de route et utilisation depuis Android.

## Prérequis
Node.js 20+, npm et Docker sont nécessaires pour exécuter localement les services. Un environnement cloud comme GitHub Codespaces peut être utilisé depuis un navigateur mobile.

## Démarrage du backend
Depuis le dossier `backend` :
```bash
npm install
npm run build
npm run start:dev
```
Le contrôle de santé sera disponible à `/api/v1/health`.

Les fichiers `.env.example` sont des modèles. Remplacez toutes les valeurs de démonstration avant tout déploiement. Aucun secret réel ne doit être ajouté au dépôt.
