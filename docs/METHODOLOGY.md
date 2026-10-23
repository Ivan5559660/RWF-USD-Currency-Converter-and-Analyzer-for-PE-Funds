# Méthodologie financière

## 1. Convention de taux

Le taux `S` est exprimé en **RWF pour 1 USD** (1 USD = S RWF).
Un taux qui monte signifie que le RWF s'affaiblit.

## 2. Formules

| Besoin | Formule |
|---|---|
| NAV en USD | `NAV_USD = NAV_RWF / S` |
| Variation de valeur du RWF en USD entre deux dates | `effet_change = S_début / S_fin - 1` |
| Rendement local | `r_RWF = NAV_RWF_fin / NAV_RWF_début - 1` (hors flux) |
| Rendement en USD | `r_USD = (1 + r_RWF) x (S_début / S_fin) - 1` |
| Taux stressé pour une dépréciation de p % | `S_stress = S / (1 - p)` |
| NAV en USD stressée | `NAV_USD_stress = NAV_RWF / S_stress = NAV_USD x (1 - p)` |

Définition de la dépréciation de p % : la valeur d'1 RWF exprimée en USD baisse de p %.
Ce n'est pas la même chose que « le taux monte de p % » (le taux monte de p / (1 - p)).

## 3. Volatilité

- Rendements logarithmiques journaliers : `x_t = ln(S_t / S_{t-1})`
- Volatilité journalière : écart-type échantillon (n - 1) des `x_t`
- Volatilité annualisée : `sigma_jour x racine(252)` (hypothèse : 252 jours de cotation ;
  à documenter si une autre base est choisie)
- Utiliser uniquement des jours cotés, sans remplir artificiellement les week-ends.

## 4. Hypothèses

- Rendement local calculé sans flux (pas d'appels de fonds ni de distributions) ; un TRI
  avec flux serait une évolution ultérieure.
- Taux unique par date (taux de référence ou taux moyen, selon la source ; toujours indiquer lequel).
- Date sans cotation : dernier taux disponible avant la date.

## 5. Exemples chiffrés (à reprendre dans les tests)

### Exemple A : conversion de NAV
NAV = 5 000 000 000 RWF.

| Date (exemple) | Taux S | NAV en USD |
|---|---|---|
| T0 | 1 300 | 3 846 153,85 |
| T1 | 1 430 | 3 496 503,50 |

Perte de valeur en USD due au change : 3 846 153,85 - 3 496 503,50 = **349 650,35 USD**
(soit -9,09 %, égal à `1300 / 1430 - 1`).

### Exemple B : rendement local vs rendement USD
Rendement local : +12 %. Taux de 1 300 à 1 430.

```
r_USD = 1,12 x (1300 / 1430) - 1
      = 1,12 x 0,909091 - 1
      = +1,82 %
```

Un rendement local de 12 % devient environ 1,82 % en USD. Effet de change : -9,09 %.

### Exemple C : sensibilité
NAV = 5 000 000 000 RWF, taux de départ S = 1 430 (NAV de départ = 3 496 503,50 USD).

| Dépréciation du RWF | Taux stressé | NAV en USD | Écart |
|---|---|---|---|
| 0 % | 1 430,00 | 3 496 503,50 | 0 |
| 3 % | 1 474,23 | 3 391 608,39 | -104 895,10 |
| 5 % | 1 505,26 | 3 321 678,32 | -174 825,17 |
| 10 % | 1 588,89 | 3 146 853,15 | -349 650,35 |

### Exemple D : lecture de l'écart entre « taux +p % » et « dépréciation p % »
Pour p = 10 % : S_stress = 1 430 / 0,9 = 1 588,89, soit un taux en hausse de 11,11 %,
et non de 10 %. Si l'outil affiche 1 573,00 (1 430 x 1,10), la formule est fausse.

## 6. Tolérances pour les tests
- Montants en USD : tolérance de 0,01.
- Pourcentages : tolérance de 0,0001 (0,01 point).
