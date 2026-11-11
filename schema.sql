-- Run in the Supabase SQL editor. Keep the mod-files bucket PRIVATE.
create extension if not exists pgcrypto;

create table if not exists public.products (
 id uuid primary key default gen_random_uuid(),
 slug text unique not null,
 name text not null,
 description text not null default '',
 category text not null,
 price_inr integer not null check(price_inr >= 0),
 price_usd integer check(price_usd is null or price_usd >= 0),
 image_urls text[] not null default '{}',
 file_path text,
 version text,
 file_size text,
 is_published boolean not null default false,
 is_featured boolean not null default false,
 created_at timestamptz not null default now()
);

create table if not exists public.orders (
 id uuid primary key default gen_random_uuid(),
 user_id uuid references auth.users(id),
 email text not null,
 currency text not null default 'INR',
 total_minor integer not null check(total_minor > 0),
 status text not null default 'pending' check(status in ('pending','paid','failed','refunded')),
 razorpay_order_id text unique,
 razorpay_payment_id text,
 created_at timestamptz not null default now()
);

create table if not exists public.order_items (
 id uuid primary key default gen_random_uuid(),
 order_id uuid not null references public.orders(id) on delete cascade,
 product_id uuid not null references public.products(id),
 product_name text not null,
 unit_price_minor integer not null,
 quantity integer not null check(quantity > 0)
);

create table if not exists public.download_grants (
 id uuid primary key default gen_random_uuid(),
 order_item_id uuid not null references public.order_items(id) on delete cascade,
 user_id uuid references auth.users(id),
 email text not null,
 expires_at timestamptz,
 created_at timestamptz not null default now()
);

alter table public.products enable row level security;
alter table public.orders enable row level security;
alter table public.order_items enable row level security;
alter table public.download_grants enable row level security;

create policy "Public can view published products" on public.products
 for select using (is_published = true);

-- Orders, items and download grants are server-only in this starter.
-- Use the Supabase service-role key only in server routes; never expose it to browsers.
-- Add customer-specific select policies after implementing verified user/email ownership.
