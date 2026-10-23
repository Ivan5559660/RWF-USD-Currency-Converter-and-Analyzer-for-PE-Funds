# Contexte du projet

## Objectif
Outil d'aide à la décision pour un fonds de private equity investissant au Rwanda.
Les actifs et la NAV sont en RWF, mais les investisseurs (LPs) et le reporting
sont en USD. L'outil mesure l'impact du risque de change RWF/USD sur la valeur
liquidative (NAV) et sur le rendement.

## Utilisateurs
Analystes financiers, gestionnaires de fonds, équipe de reporting aux investisseurs.
Profil professionnel : interface sobre, chiffres précis, pas de décoration inutile.

## Concepts métier
- NAV (valeur liquidative) : valeur des actifs du fonds moins les passifs, en RWF.
- Risque de change : la NAV en USD varie même si la NAV en RWF est stable.
- Rendement local : performance en RWF.
- Rendement en devise : performance en USD, après effet de change.

## Convention de taux (à respecter partout)
Le taux est exprimé en RWF pour 1 USD (ex. : 1 USD = X RWF).
- NAV_USD = NAV_RWF / taux
- Rendement USD = (1 + rendement_RWF) x (taux_début / taux_fin) - 1
- Une dépréciation du RWF de p % signifie que 1 RWF vaut p % de USD en moins,
  donc taux_stressé = taux / (1 - p).

## Données
- Source principale : taux publiés par la Banque Nationale du Rwanda (BNR)
  ou une API de taux de change couvrant le RWF avec historique.
- Source de secours : public/data/fallback-rates.csv.
- Toujours afficher la source et la date de dernière mise à jour du taux.
- Si une date n'a pas de cotation (week-end, jour férié), utiliser le dernier taux
  disponible avant cette date et l'indiquer à l'utilisateur.

## Règles de qualité
- Calculs financiers en fonctions pures dans src/lib/finance/, testés avec Vitest.
- Aucune valeur de taux codée en dur dans les composants.
- Gérer les erreurs : source indisponible, date sans cotation, saisie invalide.
- Interface en français, nombres au format français, devise toujours précisée.
- Pas d'authentification pour cette version.
