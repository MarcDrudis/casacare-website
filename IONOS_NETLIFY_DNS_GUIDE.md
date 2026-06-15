# Connecting IONOS Domain to Netlify (Without Transfer)

This guide explains how to point your IONOS-registered domain to a Netlify-hosted site without transferring domain ownership. This approach lets you keep your domain registered with IONOS while hosting your site on Netlify.

## Overview

DNS pointing allows you to use your IONOS domain with Netlify hosting by updating DNS records at IONOS. This is simpler than domain transfer and maintains your existing domain registration.

**Benefits of DNS Pointing vs. Transfer:**
- No 60-day waiting period or transfer lock
- Keep existing IONOS services (email, etc.)
- Faster setup (minutes vs. days)
- No transfer fees
- Easier to reverse if needed

## Prerequisites

- Active domain registered with IONOS
- Netlify site deployed and ready
- Access to IONOS account with domain management permissions
- Access to Netlify account

## Step-by-Step Configuration

### Step 1: Get Netlify DNS Information

1. Log in to your [Netlify account](https://app.netlify.com)
2. Navigate to your site
3. Go to **Site settings** → **Domain management**
4. Click **Add custom domain**
5. Enter your IONOS domain name
6. Netlify will provide DNS configuration instructions

**Note the following Netlify information:**
- Primary domain name servers (if using Netlify DNS)
- OR A record IP address and CNAME target (if using IONOS DNS)

### Step 2: Configure DNS at IONOS

#### Option A: Using IONOS DNS (Recommended for Beginners)

1. Log in to [IONOS Control Panel](https://www.ionos.com)
2. Navigate to **Domains & SSL**
3. Select your domain
4. Click **DNS** or **Manage DNS**
5. Configure the following records:

**For root domain (casacare.agency):**

**Recommended approach (if IONOS supports ALIAS/ANAME):**
```
Type: ALIAS (or ANAME or flattened CNAME)
Host: @
Value: apex-loadbalancer.netlify.com
TTL: 3600 (or default)
```

> **💡 Note:** ALIAS/ANAME records are more resilient than A records as they automatically update if Netlify changes their IP addresses. Check if IONOS supports these record types in your DNS settings.

**Fallback approach (if ALIAS/ANAME not available):**
```
Type: A
Host: @
Value: 75.2.60.5
TTL: 3600 (or default)
```

**For www subdomain:**
```
Type: CNAME
Host: www
Value: [your-site].netlify.app
TTL: 3600 (or default)
```

6. Remove any conflicting A, ALIAS, ANAME, or CNAME records for @ and www
7. Save changes

#### Option B: Using Netlify DNS (Advanced)

1. In Netlify, go to **Site settings** → **Domain management** → **Netlify DNS**
2. Note the four Netlify nameservers (e.g., `dns1.p01.nsone.net`)
3. In IONOS Control Panel:
   - Navigate to **Domains & SSL** → Your domain
   - Click **Nameservers** or **DNS Settings**
   - Select **Custom nameservers**
   - Enter all four Netlify nameservers
   - Save changes

> **⚠️ Warning:** Changing nameservers affects ALL DNS records (email, subdomains, etc.). Only use this option if you're moving all services to Netlify or understand DNS management.

### Step 3: Configure SSL Certificate in Netlify

1. In Netlify, go to **Site settings** → **Domain management**
2. Scroll to **HTTPS** section
3. Click **Verify DNS configuration**
4. Once verified, click **Provision certificate**
5. Wait 1-2 minutes for SSL certificate to activate

### Step 4: Verify Configuration

1. Wait 5-60 minutes for DNS propagation
2. Test your domain in a browser
3. Verify HTTPS is working (padlock icon)
4. Test both `example.com` and `www.example.com`

**Check DNS propagation:**
- Use [WhatsMyDNS.net](https://www.whatsmydns.net)
- Enter your domain name
- Select A or CNAME record type
- Verify records are propagating globally

## DNS Propagation Timeline

- **Minimum:** 5-15 minutes
- **Typical:** 1-4 hours
- **Maximum:** 24-48 hours (rare)

During propagation, some users may see the old site while others see the new one.

## Important Considerations

### Email Services

If you use IONOS email with your domain:
- **Option A (IONOS DNS):** Email continues working normally
- **Option B (Netlify DNS):** You must manually add MX records in Netlify DNS

**To preserve IONOS email with Netlify DNS:**
1. Before changing nameservers, export all DNS records from IONOS
2. After switching to Netlify DNS, add these MX records:
```
Priority: 10
Host: @
Value: mx00.ionos.com

Priority: 10
Host: @
Value: mx01.ionos.com
```

### Subdomains

Any existing subdomains (e.g., `blog.example.com`, `shop.example.com`) will need to be reconfigured:
- **With IONOS DNS:** Add CNAME records pointing to Netlify
- **With Netlify DNS:** Recreate all subdomain records

### Domain Renewal

Your domain remains registered with IONOS. Remember to:
- Renew domain registration at IONOS
- Keep IONOS account active
- Maintain payment information at IONOS

## Troubleshooting

### Domain Not Resolving

**Check:**
- DNS records are correctly entered (no typos)
- Old conflicting records are removed
- Sufficient time has passed for propagation (wait 1 hour minimum)

**Solution:**
- Use `nslookup yourdomain.com` or `dig yourdomain.com` to verify DNS
- Clear browser cache and try incognito mode
- Try different device or network

### SSL Certificate Not Provisioning

**Common causes:**
- DNS not fully propagated yet
- CAA records blocking Let's Encrypt
- Conflicting DNS records

**Solution:**
1. Wait 1-2 hours for DNS propagation
2. In IONOS, check for CAA records and remove or add:
   ```
   Type: CAA
   Host: @
   Value: 0 issue "letsencrypt.org"
   ```
3. In Netlify, click **Verify DNS configuration** again

### Email Stopped Working

**If using Netlify DNS:**
- Add IONOS MX records (see Email Services section above)
- Add SPF and DKIM records if you have them

**If using IONOS DNS:**
- Email should continue working normally
- Contact IONOS support if issues persist

### Site Shows "Page Not Found"

**Check:**
- Domain is added in Netlify (Site settings → Domain management)
- Site is deployed successfully
- No redirect rules conflicting

## Reverting Changes

To point domain back to IONOS hosting:

1. Log in to IONOS Control Panel
2. Navigate to DNS settings
3. Remove Netlify A and CNAME records
4. Add back original IONOS records (or use IONOS default)
5. If using Netlify nameservers, switch back to IONOS nameservers

## Additional Resources

- [Netlify DNS Documentation](https://docs.netlify.com/domains-https/custom-domains/)
- [IONOS DNS Management Guide](https://www.ionos.com/help/domains/)
- [DNS Propagation Checker](https://www.whatsmydns.net)

## Summary

DNS pointing is the recommended approach for most users who want to:
- Keep domain registered with IONOS
- Host site on Netlify
- Maintain existing email services
- Avoid transfer complexity and waiting periods

This configuration gives you the best of both platforms without the commitment of a full domain transfer.