# Prompts Lovable

## 1. Prompt principal (à coller en premier)

> Lis d'abord les instructions du projet (contexte métier). Crée l'application
> « RWF/USD PE Fund FX Analyzer » pour un fonds de private equity au Rwanda dont la NAV
> est en RWF et le reporting en USD. Stack : React + TypeScript + Tailwind + shadcn/ui +
> Recharts + Supabase.
>
> Pages : (1) Dashboard : taux actuel, source, date de mise à jour, historique,
> volatilité. (2) Convertisseur de NAV : NAV en RWF + date -> NAV en USD.
> (3) Rendement : rendement local vs rendement en USD sur une période.
> (4) Sensibilité : NAV en USD si le RWF se déprécie de 3 %, 5 %, 10 %.
>
> Respecte la convention de taux (RWF pour 1 USD) et les formules du contexte.
> Edge Function `fetch-fx-rates` avec cache dans la table `fx_rates`, et repli sur
> `public/data/fallback-rates.csv`. Logique de calcul dans `src/lib/finance/` avec tests
> Vitest. Interface sobre, professionnelle, en français. Ajoute un README et
> `docs/METHODOLOGY.md`.

## 2. Prompts de suivi (un par étape, pas tout d'un coup)

**Calculs**
> Dans src/lib/finance/, crée conversion.ts, returns.ts, sensitivity.ts et volatility.ts
> en fonctions pures, sans dépendance à React. Applique exactement les formules de
> docs/METHODOLOGY.md. Ajoute des tests Vitest qui reprennent les exemples chiffrés
> de ce document.

**Robustesse**
> Gère les cas limites : taux nul ou négatif, NAV négative, date future, date sans
> cotation (utiliser le dernier taux antérieur et afficher un avertissement), source
> indisponible (repli sur le CSV avec un bandeau d'information).

**Qualité**
> Affiche partout la source du taux, sa date, et la convention « RWF pour 1 USD ».
> Formate les nombres en français et précise la devise à chaque montant.

## 3. Après la génération
Faites les vérifications de docs/CHECKLIST.md avant de committer.
