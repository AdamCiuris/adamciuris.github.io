## Fix iframe "refused to connect" (Cloudflare)

Go to:
Cloudflare → Rules → Transform Rules → Modify Response Header

Add 2 rules:

1) Remove header
   Name: X-Frame-Options

2) Set header (overwrite, NOT add)
   Name: Content-Security-Policy
   Value: frame-ancestors *

Apply to:
*.yourdomain.com

Then:
- Purge cache
- Hard refresh

Done.