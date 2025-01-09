
# **Instagrid**

  

**Instagrid** est une application iPhone permettant aux utilisateurs de combiner des photos en choisissant parmi plusieurs dispositions. Une fois la composition réalisée, elle peut être partagée facilement avec ses amis grâce à une simple interaction tactile.

  

## **📝 Description**

  

**Instagrid est une application simple, élégante et intuitive, conçue pour :**

  

**• Créer des compositions photo personnalisées en quelques clics.**

**• Permettre une sélection facile et rapide des photos dans la photothèque.**

**• Offrir une expérience fluide grâce à des animations modernes et un partage simplifié.**

  

## **📜 Fonctionnalités principales**

  

**1\. Sélection de la disposition des photos**

  

**L’utilisateur peut choisir parmi trois dispositions prédéfinies pour organiser ses photos :**

  

**• Une fois une disposition sélectionnée, la grille principale s’adapte automatiquement.**

**• La disposition précédente est désélectionnée.**

  

**2\. Ajout de photos**

**• Chaque case de la grille dispose d’un bouton permettant d’ajouter une photo à partir de la photothèque.**

**• Les photos ajoutées sont centrées, redimensionnées pour occuper tout l’espace disponible, et conservent leurs proportions.**

**• L’utilisateur peut remplacer une photo dans la grille en cliquant dessus et en en sélectionnant une autre.**

  

**3\. Swipe to share**

**• En mode portrait**, l’utilisateur effectue un swipe vers le haut pour partager sa création.

• En **mode paysage**, le swipe s’effectue vers la gauche.

• Une animation fluide affiche la grille disparaissant de l’écran, suivie de l’ouverture du **UIActivityController** pour choisir l’application de partage.

• Une fois le partage terminé, annulé ou échoué, la grille revient à sa position initiale grâce à une animation inverse.

  

## **🎨 Design**

**• Interface adaptative (Responsive)** :

• Support des orientations portrait et paysage.

• Fonctionne sur toutes les tailles d’écran des iPhones, de l’iPhone SE à l’iPhone XS Max.

• Utilisation d’AutoLayout pour garantir une expérience cohérente sur différents appareils.

• **Polices utilisées** :

• [Delm](https://s3-eu-west-1.amazonaws.com/course.oc-static.com/projects/DAiOS_P5/Delm-Medium.otf)

**•** [ThirstySoft](https://s3-eu-west-1.amazonaws.com/course.oc-static.com/projects/DAiOS_P5/ThirstySoftRegular.otf)

  

## **📂 Structure technique**

  

**Composants principaux**

**1\. Grille de disposition** : Vue personnalisée ajustable pour organiser les photos.

2\. **UIImagePickerController** : Permet de sélectionner des photos depuis la photothèque.

3\. **UISwipeGestureRecognizer** : Gère les interactions tactiles pour partager la création.

4\. **UIActivityViewController** : Offre un menu de partage intégré.

  

**Contraintes techniques**

**• Langage** : Swift 4 ou supérieur.

• **Compatibilité** : iOS 11.0 et supérieur.

• **Plateforme** : iPhone uniquement (pas de support pour iPad).

  

## **🚀 Installation**

**1\. Clonez le dépôt GitHub :**

 ```bash
git clone https://github.com/GianiGBS/Instagrid.git

cd Instagrid
```
  

  

  

**2\. Ouvrez le projet dans Xcode.**

**3\. Lancez l’application sur un simulateur ou un appareil physique compatible.**

  

## **📈 Statistiques et métriques**

**• Résolution dynamique** : S’adapte aux orientations et tailles d’écran.

• **Animations fluides** : Partage et retour d’interface optimisés.

  

## **🤝 Contribution**

  

**Les contributions sont les bienvenues ! Si vous avez des idées ou des améliorations, ouvrez une issue ou une pull request sur ce dépôt.**

  

## **📜 License**

  

**Ce projet est sous licence MIT. Consultez le fichier LICENSE pour plus d’informations.**

  

## **🎥 Démonstration**

  

**Voici un exemple d’utilisation de l’application :**

  

**1\. L’utilisateur sélectionne une disposition.**

**2\. Ajoute des photos à chaque case.**

**3\. Effectue un swipe pour partager la création.**

##
