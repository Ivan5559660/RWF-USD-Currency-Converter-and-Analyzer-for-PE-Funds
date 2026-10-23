-- Cache serveur des taux de change RWF/USD
-- Convention : rate = nombre de RWF pour 1 USD

create table if not exists public.fx_rates (
  id          bigint generated always as identity primary key,
  rate_date   date           not null,
  rate        numeric(14, 4) not null check (rate > 0),
  source      text           not null,
  fetched_at  timestamptz    not null default now(),
  unique (rate_date, source)
);

create index if not exists fx_rates_date_idx on public.fx_rates (rate_date desc);

alter table public.fx_rates enable row level security;

-- Lecture publique
create policy "fx_rates_public_read"
  on public.fx_rates for select
  to anon, authenticated
  using (true);

-- Aucune policy d'écriture : seule la clé service (Edge Function) peut insérer/mettre à jour.
