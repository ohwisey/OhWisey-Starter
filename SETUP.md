# OhWisey-Starter Setup

A blank personal dashboard you extend with standalones. ~15 minutes total.

## What you'll need
- A free Supabase account
- A free Vercel account (requires phone verification at signup)
- A GitHub account

## Step 1: Create your dashboard
Click "Use this template" on this repo → name your new repo → Create.

## Step 2: Set up your database (Supabase)
1. Sign up at https://supabase.com (free)
2. New Project → name → set a database password → wait ~60s
   - Note: you won't need this password later. Magic-link auth doesn't use it.
3. Leave Security checkboxes at default
4. Left sidebar → SQL Editor → + New query
5. Open `supabase/schema.sql` in this repo → copy contents → paste → Run
6. Should see "Success. No rows returned."

## Step 3: Get your Supabase credentials
Project URL and key live on TWO different pages.

**Project URL:**
1. Left sidebar → Project Settings (gear icon, bottom-left) → Data API
2. Find the "API URL" section
3. **IMPORTANT:** URL is shown as `https://xxx.supabase.co/rest/v1/` — DELETE `/rest/v1/`. Keep only `https://xxx.supabase.co`

**Publishable key:**
1. Same Settings → API Keys page
2. Copy the publishable key (starts with `sb_publishable_`)

## Step 4: Deploy to Vercel
1. https://vercel.com → Continue with GitHub
   - Phone verification required at signup
2. Add New → Project → find Import Git Repository → Import your forked repo
3. Leave settings at default → Deploy → wait ~30s
4. Vercel gives you a URL ending in `.vercel.app` — copy it

## Step 5: Tell Supabase your Vercel URL (critical — skip this and magic-link breaks)
1. Supabase → left sidebar → Authentication → URL Configuration
2. Paste your Vercel URL into Site URL → Save

## Step 6: Sign in
1. Open your Vercel URL → click gear (top-right)
2. Paste Supabase URL + publishable key → Save
3. Settings sheet re-renders with email field
4. Enter your email → click "Send magic link" ONCE
   - **IMPORTANT:** Don't click multiple times. Supabase rate-limits magic-link emails (~3-4 per hour per project). Repeated clicks extend cooldown.
5. Check inbox → click the NEWEST magic-link email immediately (links expire in a few minutes)
6. You should land on your dashboard signed in

## Step 7: Add a standalone (optional)
Empty by design. See the standalone's README for embed instructions.

For SplitLog (workout tracker): https://github.com/ohwisey/splitlog

## Troubleshooting
- **"email rate limit exceeded"** → wait ~1 hour, or create a fresh Supabase project
- **Magic link redirects to localhost** → you skipped Step 5
- **"otp_expired" error** → link is too old, send fresh one and click within 2 min
