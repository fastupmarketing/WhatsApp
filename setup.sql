-- FastUp WhatsApp Dashboard — setup.sql
-- Supabase SQL Editor-এ পুরোটা পেস্ট করে Run করুন।
-- এটা আপনার আগের ৫টা টেবিল (chat_ai_settings, customer_leads, customers,
-- wa_message_buffer, whatsapp_chat_history) বদলায় না — শুধু যা নেই তা যোগ করে।

-- ১. customers টেবিলে tag + ফলো-আপের কলাম যোগ করা
alter table public.customers
  add column if not exists tag text not null default 'new',
  add column if not exists followup_count integer not null default 0,
  add column if not exists followup_status text,
  add column if not exists followup_quality text;

-- ২. Sales Sheet-এর জন্য sales টেবিল
create table if not exists public.sales (
  id uuid primary key default gen_random_uuid(),
  client_name text not null,
  product text,
  amount numeric not null,
  currency text not null default 'BDT',
  created_at timestamptz not null default now()
);

-- ৩. অ্যাক্সেস: ড্যাশবোর্ডে Supabase লগইন করা ইউজাররাই পড়তে-লিখতে পারবে
-- (anon key দিয়ে লগইন ছাড়া কেউ ঢুকতে পারবে না)
alter table public.sales enable row level security;

drop policy if exists "sales_all_authenticated" on public.sales;
create policy "sales_all_authenticated" on public.sales
  for all to authenticated using (true) with check (true);
