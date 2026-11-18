# FastUp WhatsApp Dashboard

FastUp Marketing-এর WhatsApp চ্যাট দেখা আর রিপ্লাই দেওয়ার ড্যাশবোর্ড।

## ফাইল দুইটা

- **index.html** — ড্যাশবোর্ডের পুরো পেজ। ব্রাউজারে খুললেই চলবে। প্রথমবার Supabase-এর URL আর anon key চাইবে, সেটা ব্রাউজারেই সেভ থাকে — কোডে কোনো চাবি লেখা নেই।
- **setup.sql** — Supabase-এর SQL Editor-এ পুরোটা পেস্ট করে Run করলে যা যা লাগে তা তৈরি হয়ে যাবে (আগের টেবিল বদলাবে না, শুধু যা নেই তা যোগ হবে)।

## চালু করার ধাপ

১. Supabase-এ `setup.sql` Run করুন।
২. ড্যাশবোর্ড খুলে Supabase URL আর anon key বসান।
৩. ড্যাশবোর্ড থেকে পাঠানো মেসেজ WhatsApp-এ যেতে n8n-এ একটা Webhook workflow লাগবে — তার URL Settings-এ বসান।
