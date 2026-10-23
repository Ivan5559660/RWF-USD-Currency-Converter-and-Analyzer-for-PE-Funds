# RWF/USD PE Fund FX Analyzer

Outil d'aide à la décision pour un fonds de private equity au Rwanda : mesurer l'impact
du risque de change RWF/USD sur la valeur liquidative (NAV) et sur le rendement.

> Projet test, généré avec Lovable AI (React + TypeScript + Supabase), puis relu et corrigé à la main.

## Contenu de ce dossier

| Fichier | Rôle |
|---|---|
| `docs/CONTEXT.md` | Contexte métier. À coller dans la « Knowledge » du projet Lovable. |
| `docs/LOVABLE_PROMPT.md` | Prompt de départ + prompts de suivi. |
| `docs/ARCHITECTURE.md` | Arborescence cible et rôle de chaque dossier. |
| `docs/METHODOLOGY.md` | Formules, hypothèses et exemples chiffrés calculés à la main. |
| `docs/CHECKLIST.md` | Liste de contrôle pour valider ce que Lovable a généré. |
| `supabase/migrations/001_create_fx_tables.sql` | Table `fx_rates` + sécurité (RLS). |
| `public/data/fallback-rates.csv` | Modèle du jeu de secours (valeurs illustratives, à remplacer). |
| `.env.example` | Variables d'environnement attendues. |

## Mode d'emploi

1. Créez un nouveau projet dans Lovable.
2. Collez `docs/CONTEXT.md` dans les instructions persistantes (Knowledge) du projet.
3. Collez le prompt principal de `docs/LOVABLE_PROMPT.md` dans le chat.
4. Connectez le dépôt GitHub depuis Lovable.
5. Contrôlez le résultat avec `docs/CHECKLIST.md` et `docs/METHODOLOGY.md`.
6. Corrigez à la main, committez, ajoutez captures d'écran et lien de démo ici.

## À compléter après génération

- Captures d'écran
- Lien de la démo en ligne
- Source réelle des taux et sa date de dernière vérification
