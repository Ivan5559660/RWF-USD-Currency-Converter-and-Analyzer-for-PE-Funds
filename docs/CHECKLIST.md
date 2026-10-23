# Checklist de validation du code généré

## Calculs (priorité 1)
- [ ] `conversion.ts` : 5 000 000 000 RWF à 1 300 donne 3 846 153,85 USD
- [ ] `conversion.ts` : le taux n'est jamais inversé (RWF pour 1 USD, partout)
- [ ] `returns.ts` : +12 % local, taux 1 300 -> 1 430 donne +1,82 % en USD
- [ ] `sensitivity.ts` : 10 % de dépréciation donne un taux de 1 588,89 (pas 1 573,00)
- [ ] `volatility.ts` : rendements logarithmiques, annualisation documentée
- [ ] Les tests Vitest utilisent les exemples de METHODOLOGY.md et passent

## Données
- [ ] La source des taux est identifiée, avec date de dernière mise à jour affichée
- [ ] La source couvre bien le RWF et l'historique nécessaire
- [ ] Le repli sur le CSV fonctionne quand la source est coupée
- [ ] Le CSV de secours contient de vraies valeurs (pas les valeurs illustratives)
- [ ] Une date de week-end renvoie le dernier taux antérieur, avec avertissement

## Sécurité
- [ ] RLS activée sur `fx_rates`, écriture réservée à la clé service
- [ ] Aucune clé secrète dans le dépôt (seul `.env.example` est versionné)

## Interface
- [ ] Nombres au format français, devise précisée à chaque montant
- [ ] La convention « RWF pour 1 USD » est visible dans l'interface
- [ ] Messages d'erreur clairs (source indisponible, saisie invalide)

## Dépôt GitHub
- [ ] README complété : captures d'écran, lien de démo, méthodologie
- [ ] Commits manuels de votre part sur la logique financière
