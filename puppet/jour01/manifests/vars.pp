## types de variables 

$var = 'mavariables'

$tableau = [ 'test', $var ]

$dictionnaire = {
  cle => 'valeur',

}

$complexe = [
  {
    'prenom' => 'frédéric',
    'nom'    => 'Gontier',
  },
  'machaine',
]

## recupère les valeurs

$test = $dictionnaire[cle]

## mode d'affichage
debug('mon debug') ## necessite l'option --debug

notice("ma variable test : ${test}")

notice("tableau premier indice : ${tableau[0]}")

notice("dictionnaire index cle : ${dictionnaire['cle']}")

notice("utilisation des facts os.architecture : ${os[architecture]}")

warning("utilisation des facts os.family : ${facts['os']['family']}")

err('mon erreur 1 == 0')

## utilisation des notifications pour afficher que sur les agents
notify{'montitre' :
  message  => "complexe : Bonjour ${complexe[0]['prenom']} ${complexe[0]['nom']}, voila ton message : '${complexe[1]}'",
  withpath => true,
}



