CREER UNE SOURCE GITHUB ET METTRE UN DEB SUR SON GITHUB

Pour ce tutoriel, il ne sera que disponible pour Mac et Linux.
Windows n’étant pas prit en compte pour la non-compatibilité du noyau (la cause du Noyaux Windows ≠ (different) du Noyau GNU/Linux)

- Avoir installer  brew : https://brew.sh/index_fr (si ce n’es pas fait)
- Avoir installé dpkg : brew install dpkg (si ce n’es pas fait)

[CRÉATION D’UN DEB] 

Créer un dossier qui portera le nom du tweak et créer trois sous dossier :

MODELE DE CONSTRUCTION D’UN DEB

📂 DEBIAN
 ↳ 🗂control
    ↳ 📄control 
 ↳ 🗂preinst (optionnel)
    ↳ 📄preinst
 ↳ 🗂postinst (optionnel)
    ↳ 📄postinst
 ↳ 🗂prerm (optionnel)
    ↳ 📄prerm
 ↳ 🗂postrm (optionnel)
    ↳ 📄postrm
📂 Applications
 ↳ 🗂Application.app
📂Library (racine de l’iDevice)
 ↳ 🗂usr (exemple)
 ↳ 🗂var (exemple)


Dans le dossier « 🗂 control », un fichier « control » (sans extension)  modifiable avec : 
- Mac : TextEdit / Xcode 
- Linux : Terminal / Gedit

Voici un exemple du contenu du fichier control:

Package: com.vous.nomdevotrepaquet
Name: Nom du tweak
Depends: mobilesubstrate (NE PAS TOUCHER)
Architecture: iphoneos-arm (NE PAS TOUCHER)
Description: la description de votre tweak
Maintainer: vous <votre adresse mail> (laissez bien les < > )
Author: vous
Section: catégorie concernant le tweak
Version: version de votre tweak


Pour le dossier Applications, il sera pas nécessaire de modifier ce dossier, il n’y a pas d’application a l’intérieur, à par si vous voulez mettre une application dans votre source pour l’afficher sur le SpringBoard.

Pour le dossier Library, il sera le point de départ de la racine de l’iDevice.

— — — — — — 

Apres que le fichier control est complété, on va utiliser le Terminal.
Rien de plus compliqué, juste à recopier les lignes de commandes du tutoriel.

Avec le Terminal, on va aller sur le bureau

- Mac / Linux : cd /Desktop (pour mac et Linux)

Avec le terminal, on va « Transformer » le dossier que vous avez créer en « .deb » 

dpkg -b com.vous.nomdevotrepaquet

Le deb est apparu sous forme de fichier compressé.

— — — — — —

Ensuite, vous allez créer un fichier avec extension sh qui s’appellera « update.sh ».

le fichier update.sh contiendra ces lignes :

#!/bin/sh
rm -rf Packages Packages.bz2
dpkg-scanpackages -m ./debs/ /dev/null >Packages
bzip2 -k -z Packages 


Si un jour, vous voyez dans plusieurs sources sur github ou d’autres sources, le fichier « Packages.gz », il sera pas vraiment utile de le créer, puisque que pour que votre source soit reconnu, il lui faut que 3 fichiers nécessaires  pour l’affichage des paquets sur le gestionnaire de paquets: 

- Packages
- Packages.bz2
- Release



Dès que le fichier update est crée, vous allez créer un fichier sans extension au nom de « Packages » (dans le bureau de preference)

Vous y rajouterez les informations ci dessous : 

Package: com.vous.nomdevotrepaquet
Version: 1.0
Architecture: iphoneos-arm
Maintainer: vous <votre adresse mail>
Depends: mobilesubstrate
Filename: ./debs/Debian/votretweak/deb/com.vous.nomdevotrepaquet.deb
Section: catégorie concernant le tweak
Description: la description de votre tweak
Author: vous <votre adresse mail>
Name: Nom du tweak



Fichier Packages fait, vous pouvez lancer la commande dans le terminal (n’oubliez pas, il faut vous localiser dans le bureau) :

 ./update

Le fichier Packages.bz2 apparait dans le bureau.

— — — — — —
[SUR LE SITE DE GITHUB] 

Créer un compte GitHub et créer un REPOSITORY (repo):
https://github.com/new


Sur GitHub, pour votre source, il vous faut IMPÉRATIVEMENT ces fichiers : 

- Release
- Packages
- Packages.bz2 (fait avec le tuto plus bas)
- CydiaIcon.png (optionnel si vous ne l’avez pas rajouté dans le fichier Release)
- debs (dossier qui vous servira au stock de vos « créations » tweak deb)

Packages.gz n’étant pas nécessaire pour le fonctionnement de la source, à oublier.

(prenez exemple sur mon GitHub la disposition de mon repo: https://github.com/iPhoenix42/repo.ios

Et bien sur, dans les réglages de votre repo ( ⚙ Settings, en haut à droite), bien activer sur l’option « Github Pages » 
- Source -> « Master Branch » (pour que votre iDevice « capte » votre source.

Votre repos est en ligne.
Vous pouvez ajouter votre repo sur votre gestionnaire de paquet (Cydia / Sileo / Zebra / Installer 5)

— — — — — —


Pour ajouter vos « création », il ne reste plus qu’à : 

Ajouter vos fichiers (pour remplacer les anciens si vous les avez fais sur votre bureau):

- Packages
- Package.bz2 

dans votre repo

Et le deb dans le dossier « debs » de votre repo.

Attendez environ 20-30 sec pour voir le changement sur votre repo qui est sur votre gestionnaire de paquet (Cydia / Sileo / Zebra / Installer 5)
