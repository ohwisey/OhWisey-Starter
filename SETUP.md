# OhWisey-Starter Setup

A blank personal dashboard you can extend with standalones.

## What you'll need
- A free Supabase account
- A free Vercel account
- A GitHub account
- ~15 minutes

## Step 1: Create your dashboard
Click "Use this template" on this repo → name your new repo → create

## Step 2: Set up your database (Supabase)
1. Sign up at https://supabase.com (free)
2. Click "New Project" → name it → set a database password → wait ~60s for provisioning
3. Left sidebar → SQL Editor → + New query
4. Open `supabase/schema.sql` in this repo, copy contents, paste, click Run
5. You should see "Success. No rows returned."

## Step 3: Get your Supabase keys
1. Supabase → Project Settings (gear icon, bottom-left) → API
2. Copy your Project URL (e.g., `https://abc123.supabase.co`)
3. Copy your publishable key (long string)

## Step 4: Deploy to Vercel
1. https://vercel.com → sign in with GitHub
2. Add New → Project → find your forked repo → Import → Deploy
3. Wait ~30s → Vercel gives you a URL

## Step 5: Sign in
1. Open your Vercel URL → click gear (top-right)
2. Paste Project URL + publishable key → Save
3. Enter your email → Send magic link → check inbox → click link
4. You're signed in. Greeting shows your name.

## Step 6: Add a standalone (optional)
The dashboard is empty by design. To add a standalone, see the standalone's README for embed instructions.

For SplitLog (workout tracker): https://github.com/ohwisey/splitlog
