-- Supabase-Setup für das Ernährungstagebuch
-- Ausführen im Supabase-Dashboard unter "SQL Editor" (einmalig).

-- Eine Zeile pro Konto: das komplette Tagebuch als JSON.
create table if not exists public.journals (
  user_id uuid primary key references auth.users (id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

-- Row Level Security: jede Nutzerin sieht/ändert nur die eigene Zeile.
alter table public.journals enable row level security;

create policy "journals_select_own" on public.journals
  for select using (auth.uid() = user_id);

create policy "journals_insert_own" on public.journals
  for insert with check (auth.uid() = user_id);

create policy "journals_update_own" on public.journals
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "journals_delete_own" on public.journals
  for delete using (auth.uid() = user_id);
