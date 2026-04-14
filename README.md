# Todo_App_Flutter

Une application de gestion de tâches performante et intuitive développée avec **Flutter**.  
Ce projet démontre une architecture logicielle propre, une gestion d'état réactive et la persistance des données locales.  
Et l'utilisation de l'architecture MVVM

---

## 🚀 Fonctionnalités

* **Gestion des tâches** : Création, modification et suppression (CRUD).
* **États interactifs** : Marquage des tâches complétées avec mise à jour visuelle immédiate.
* **Persistance locale** : Sauvegarde automatique des données via `shared_preferences` pour conserver vos tâches après fermeture.
* **Interface Responsive** : Layout optimisé pour Android et iOS.
* **Performance** : Optimisation des cycles de rendu pour une navigation fluide.

## 🛠️ Stack Technique

* **Framework** : [Flutter 3.x](https://flutter.dev/)
* **Langage** : [Dart](https://dart.dev/)
* **Gestion d'état** : Provider
* **Stockage** : SQLite

## 📦 Installation

### Prérequis
* Flutter SDK installé
* Un émulateur ou un appareil physique connecté

### Étapes
1. **Cloner le projet**
 ```bash
   git clone "https://github.com/gboissel/Todo_App_Flutter"
   ```
2. executez ces commandes
  ```bash
  cd todo-app-flutter
  flutter pub get
  flutter devices
  flutter run
  ```
3. en cas de probleme avec le cache
  ```bash
  flutter clean
  flutter pub get
  ```
