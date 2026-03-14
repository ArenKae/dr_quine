# EAX = Accumulateur 
Historiquement, stockage des résultats intermédiaires de l'UAL (retenues, etc).
Registre souvent utilisé implicitement par certaines instructions arithmétiques  (mul, div) et pour la valeur de retour des fonctions.
Il est composé de 2 sous-parties : AH (haute) et AL (basse), qui peuvent être
appelées indépendamment pour manipuler facilement des octets.

# ECX = Compteur
Utilisé pour itérer des variables, mettre en place des boucles (loop),
ou lors du transfert de données entre ESI et EDI (rep).
Il est composé de 2 sous-parties : CH (haute) et CL (basse).
CL est parfois utilisé par certaines instructions pour des décalages
spéciaux.

# EDX = Données
Registre souvent utilisé comme extension de EAX pour les opérations arithmétiques produisant des résultats plus larges.
On peut notamment utiliser le couple EDX:EAX pour représenter un entier 
64 bits (EDX représente alors la partie haute du résultat).

# EBX = Base
Sert historiquement à l'adressage indirect, qui consiste à stocker l'adresse
d'une donnée dans le registre, que l'on va lire pour aller récupérer la 
donnée en mémoire vive.
De nos jours, registre général sans rôle obligatoire.

# ESP = Stack pointer
Contient un pointeur vers le sommet de la stack (pile), c'est à dire 
l'emplacement de la dernière entrée.

# EBP = Base pointer
Souvent utilisé pour effectuer un "backup" de ESP, afin de capturer le stack frame actuel, pour y faire appel plus tard. Utile pour accéder rapidement aux variables locales, agruments de fonction, etc.

# ESI = Indice source
Souvent utilisé comme pointeur source dans les opérations mémoire.
Utilisé implicitement dans les instruction de manipulation de chaînes.

# EDI = Indice destination
Souvent utilisé comme pointeur destination dans les opérations mémoire.
(Exemple : copier une valeur d'une adresse source vers une adresse de destination). Très utile dans la gestion de tableaux.