# OhWisey-Starter

A blank personal dashboard template. Fork it via "Use this template," extend it with standalones, own everything.

[See SETUP.md for full instructions](./SETUP.md)

## What's included
- Time-aware greeting (your name after sign-in)
- Today's date
- Supabase magic-link auth
- Clean foundation

## What's not included (intentionally)
- No pre-installed standalones
- No assumptions about what you'll build
- No corporate upsells

Your dashboard. Your data. Your code.

## Available standalones
- [SplitLog](https://github.com/ohwisey/splitlog) — Workout split tracker

## Standalone Module Contract

Standalones don't paste markup into `index.html`. They register themselves via `window.OhWisey.registerModule()` and the dashboard mounts them into a uniform card shell.

### Authoring a standalone

Your bundle calls `registerModule` exactly once. The dashboard handles container creation, insertion order, and theming.

```js
OhWisey.registerModule({
  id: 'yourname',
  mount(container) {
    // container is a <section class="ohwisey-module" data-module-id="yourname">
    // already inserted into the page and pre-styled as a card.
    container.innerHTML = '<h2>Hello from yourname</h2>';
  }
});
```

`mount(container)` receives:
- a `<section>` already in the DOM
- `class="ohwisey-module"` + `data-module-id="<your id>"`
- a **layout-only wrapper** — full-width within the 720px page column, with `overflow: hidden` for safety
- **no visual chrome**: no background, no border, no padding. The standalone owns its look. Use `--ohw-bg-card`, `--ohw-border`, `--ohw-radius` to match the dashboard's aesthetic if you want a card.

### Reading dashboard state

`window.OhWisey` exposes live getters — re-read them after auth changes; don't capture once at mount time:

| Property | Returns |
|---|---|
| `OhWisey.supabase` | the dashboard's Supabase client, or `null` until signed in |
| `OhWisey.userId` | the signed-in user's id, or `null` |

### CSS variables

The dashboard exposes these on `:root`. Use them so your standalone re-themes automatically if the dashboard's palette changes:

| Variable | Purpose |
|---|---|
| `--ohw-bg` | Page background (pure black) |
| `--ohw-bg-card` | Card surface |
| `--ohw-text` | Primary text |
| `--ohw-text-dim` | Secondary text |
| `--ohw-accent` | Mint accent |
| `--ohw-border` | Hairline border |
| `--ohw-radius` | Card border radius (16px) |
| `--ohw-font` | Font stack |

### Load order = on-page order

The dashboard mounts modules in the order they register. Classic `<script src>` tags execute top-to-bottom, so script order in `index.html` determines visual order.

### Scope your styles

Scope every CSS rule to your module id to prevent collisions with the dashboard or other standalones:

```css
[data-module-id="yourname"] h2     { font-size: 18px; color: var(--ohw-text); }
[data-module-id="yourname"] .stat  { color: var(--ohw-accent); }
```

The dashboard guarantees no two modules share an id (second registration is a no-op with a console warning).
