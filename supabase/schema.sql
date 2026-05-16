-- OhWisey Starter — Supabase schema
-- Paste into Supabase SQL Editor → New Query → Run

create table public.app_data (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade not null,
  app_slug text not null,
  key text not null,
  value jsonb not null default '{}'::jsonb,
  data_version int not null default 1,
  updated_at timestamptz not null default now(),
  unique (user_id, app_slug, key)
);

alter table public.app_data enable row level security;
create policy "read own rows"   on public.app_data for select using (auth.uid() = user_id);
create policy "insert own rows" on public.app_data for insert with check (auth.uid() = user_id);
create policy "update own rows" on public.app_data for update using (auth.uid() = user_id);
create policy "delete own rows" on public.app_data for delete using (auth.uid() = user_id);
