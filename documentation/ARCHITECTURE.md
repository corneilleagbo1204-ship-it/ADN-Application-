# Architecture initiale

- Applications mobiles : Flutter (Android et iOS).
- Portail web et administration : Next.js.
- API : NestJS, organisée en modules métier.
- Données : PostgreSQL ; cache et tâches : Redis.
- Fichiers : stockage compatible S3 (MinIO en développement).
- Appels audio/vidéo : solution WebRTC à sélectionner et configurer.
- IA : couche d'intégration indépendante du fournisseur.

Le backend démarre sous forme de monolithe modulaire afin de limiter les coûts et la complexité au lancement. La sécurité, les droits d'accès et la séparation des données doivent être appliqués côté serveur.
