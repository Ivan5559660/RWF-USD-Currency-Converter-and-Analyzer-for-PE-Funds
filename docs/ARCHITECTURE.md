# Architecture cible

Lovable génère du React + TypeScript + Supabase. Les concepts du projet Python d'origine
(`pd.read_html()`, `@st.cache_data`) sont remplacés ainsi :

| Idée d'origine | Équivalent ici |
|---|---|
| Scraping avec `pd.read_html()` | Edge Function Supabase `fetch-fx-rates` |
| `@st.cache_data` | Table `fx_rates` (cache serveur) + React Query `staleTime` (cache client) |
| Jeu de données de secours | `public/data/fallback-rates.csv` |

## Arborescence

```
rwf-usd-pe-analyzer/
├── README.md
├── .env.example
├── package.json                      (généré par Lovable)
├── vite.config.ts                    (généré par Lovable)
├── tailwind.config.ts                (généré par Lovable)
│
├── docs/
│   ├── CONTEXT.md
│   ├── LOVABLE_PROMPT.md
│   ├── ARCHITECTURE.md
│   ├── METHODOLOGY.md
│   └── CHECKLIST.md
│
├── supabase/
│   ├── config.toml
│   ├── migrations/
│   │   └── 001_create_fx_tables.sql
│   └── functions/
│       └── fetch-fx-rates/
│           └── index.ts
│
├── public/
│   └── data/
│       └── fallback-rates.csv
│
└── src/
    ├── main.tsx
    ├── App.tsx
    ├── pages/
    │   ├── Dashboard.tsx
    │   ├── NavConverter.tsx
    │   ├── ReturnAnalysis.tsx
    │   ├── SensitivityAnalysis.tsx
    │   └── NotFound.tsx
    ├── components/
    │   ├── ui/                       (shadcn/ui)
    │   ├── layout/
    │   │   ├── Header.tsx
    │   │   └── Sidebar.tsx
    │   ├── charts/
    │   │   ├── RateHistoryChart.tsx
    │   │   ├── ReturnComparisonChart.tsx
    │   │   └── SensitivityChart.tsx
    │   ├── NavInputForm.tsx
    │   └── KpiCard.tsx
    ├── lib/
    │   ├── finance/                  (fonctions pures, testées)
    │   │   ├── conversion.ts
    │   │   ├── returns.ts
    │   │   ├── sensitivity.ts
    │   │   └── volatility.ts
    │   ├── fxService.ts
    │   └── utils.ts
    ├── hooks/
    │   ├── useFxRates.ts
    │   └── useNavScenario.ts
    ├── integrations/supabase/
    │   ├── client.ts
    │   └── types.ts
    ├── types/
    │   └── fx.ts
    └── tests/
        ├── conversion.test.ts
        ├── returns.test.ts
        ├── sensitivity.test.ts
        └── volatility.test.ts
```

## Choix de conception

- **Logique financière isolée** dans `src/lib/finance/` : pas de React, pas d'appel réseau.
  C'est la partie à relire et à maîtriser vous-même.
- **Pas d'authentification ni de table `fund_scenarios`** dans cette version : les scénarios
  restent côté client. Cela évite d'avoir à gérer des données utilisateur.
- **Lecture publique, écriture réservée** : `fx_rates` est lisible par tous, mais seule
  l'Edge Function (clé service) peut y écrire.
