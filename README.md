# 🛠️ MultiTools - Ruby OSINT Framework

> Un outil OSINT (Open Source Intelligence) **puissant** écrit en Ruby pour des recherches multiples et complètes sur des cibles en ligne.

---

## 🎯 Fonctionnalités Principales

### 🌐 Reconnaissance de Domaines
- 🔍 Énumération de sous-domaines (brute-force, crt.sh, CT logs)
- 📡 Résolution DNS complète (A, AAAA, MX, NS, TXT, CNAME, SOA)
- 🔓 Scan de ports
- 🔐 Vérification SSL/TLS
- 📋 Lookup WHOIS
- ⚠️ Vérification de réputation

### 💻 Recherche d'Adresses IP
- 🌍 Localisation géographique (GeoIP)
- 🌐 Informations ASN
- 🔓 Scan de ports ouverts
- 🔧 Identification des services
- 🛡️ Vérification de réputation (VPN, proxy, datacenter)
- 🔄 Reverse DNS lookup

### 📧 Recherche d'Emails
- 📨 Énumération d'emails par domaine
- ⚡ Vérification des violations de données (Have I Been Pwned)
- 🎯 Détection de modèles d'emails
- 👤 Recherche par nom d'utilisateur

### 📱 Médias Sociaux
- 🔗 Recherche multi-plateforme
- 🐦 Twitter | 🐙 GitHub | 💼 LinkedIn | 📸 Instagram | 🤖 Reddit
- 👁️ Extraction d'informations publiques
- 🔗 Détection de comptes liés

### 🌐 Analyse d'URL
- 🚨 Vérification de réputation (phishing, malware)
- 🔒 Analyse SSL/TLS
- 📰 Extraction des en-têtes HTTP
- 🛠️ Détection des technologies
- 🐛 Scan de vulnérabilités

### ⚙️ Outils Additionnels
- 📡 Résolution DNS avancée
- 🔓 Port scanning
- 📋 WHOIS lookup
- 🔍 Subdomain enumeration

---

## 📦 Installation Rapide

```bash
# 1️⃣ Cloner le repo
git clone https://github.com/soso2402/multi_tools.git
cd multi_tools

# 2️⃣ Installer les dépendances
bundle install

# 3️⃣ Configurer l'environnement
cp .env.example .env

# 4️⃣ Éditer vos clés API
nano .env
```

---

## ⚙️ Configuration des API

Modifiez le fichier `.env` avec vos clés API:

```bash
# 🔓 Shodan - Scan de ports et serveurs
SHODAN_API_KEY=your_shodan_key

# 🐛 VirusTotal - Analyse de sécurité
VIRUSTOTAL_API_KEY=your_virustotal_key

# 📋 WhoisAPI - Lookup WHOIS
WHOISAPI_KEY=your_whoisapi_key

# 🛡️ IPQualityScore - Réputation d'IP
IPQUALITYSCORE_KEY=your_ipqs_key

# 🐦 Twitter API - Recherche Twitter
TWITTER_API_KEY=your_twitter_key
TWITTER_API_SECRET=your_twitter_secret

# 📸 Instagram - Recherche Instagram
INSTAGRAM_ACCESS_TOKEN=your_instagram_token

# 📧 Hunter - Recherche d'emails
HUNTER_API_KEY=your_hunter_key

# 🔐 Censys - Reconnaissance d'infrastructure
CENSYS_API_ID=your_censys_id
CENSYS_API_SECRET=your_censys_secret
```

---

## 🚀 Utilisation

### 🎮 Interface CLI

```bash
# 🌐 Reconnaissance de domaine
ruby bin/multi_tools domain example.com

# 💻 Lookup IP (Géolocalisation, ASN, ports)
ruby bin/multi_tools ip 1.2.3.4

# 📧 Recherche d'emails
ruby bin/multi_tools email example.com

# 👤 Recherche en médias sociaux
ruby bin/multi_tools social username

# 🌐 Scan d'URL (Malware, phishing, SSL)
ruby bin/multi_tools url https://example.com

# ℹ️ Version
ruby bin/multi_tools version

# ❓ Aide
ruby bin/multi_tools help
```

### 📚 En tant que librairie Ruby

```ruby
require 'multi_tools'

# 🌐 Reconnaissance de domaine
recon = MultiTools::DomainRecon.new('example.com')
results = recon.run
puts results.to_json

# 💻 Lookup IP
ip_lookup = MultiTools::IpLookup.new('1.2.3.4')
results = ip_lookup.run

# 🔍 Énumération de sous-domaines
subdomains = MultiTools::SubdomainEnum.new('example.com')
results = subdomains.run

# 🔓 Port scanning
scanner = MultiTools::PortScanner.new('example.com')
results = scanner.run

# 📡 Résolution DNS
dns = MultiTools::DnsResolver.new('example.com')
results = dns.run
```

---

## 📋 Architecture du Projet

```
multi_tools/ 📁
├── bin/ 📁
│   └── multi_tools          🎮 Point d'entrée CLI
├── lib/ 📁
│   └── multi_tools/
│       ├── config.rb        ⚙️ Configuration
│       ├── logger.rb        📝 Logging avec couleurs
│       ├── domain_recon.rb  🌐 Recon de domaines
│       ├── ip_lookup.rb     💻 Lookup IP & Géoloc
│       ├── email_finder.rb  📧 Recherche d'emails
│       ├── social_media.rb  📱 Médias sociaux
│       ├── url_scanner.rb   🌐 Scan d'URL
│       ├── dns_resolver.rb  📡 Résolution DNS
│       ├── port_scanner.rb  🔓 Port scanning
│       ├── subdomain_enum.rb🔍 Énumération sous-domaines
│       └── whois_lookup.rb  📋 WHOIS lookup
├── Gemfile                  📦 Dépendances
├── .env.example             📋 Configuration exemple
├── LICENSE                  📄 MIT License
└── README.md               📖 Cette documentation
```

---

## 🔑 Intégrations Supportées

| API | Fonction | 🔑 Clé Requise |
|-----|----------|----------------|
| 🔓 **Shodan** | Scan de ports et serveurs | ✅ |
| 🐛 **VirusTotal** | Analyse de fichiers et URLs | ✅ |
| 📋 **WhoisAPI** | Lookup WHOIS complet | ✅ |
| 🛡️ **IPQualityScore** | Réputation d'IP | ✅ |
| 🐦 **Twitter** | Recherche Twitter | ✅ |
| 📸 **Instagram** | Recherche Instagram | ✅ |
| 📧 **Hunter** | Recherche d'emails | ✅ |
| 🔐 **Censys** | Reconnaissance d'infrastructure | ✅ |
| 🌍 **IPapi.co** | Géolocalisation IP (gratuit) | ❌ |
| 🐙 **GitHub API** | Recherche GitHub (gratuit) | ❌ |

---

## 💡 Exemples d'Utilisation

### Exemple 1️⃣: Reconnaissance Complète d'un Domaine

```bash
ruby bin/multi_tools domain google.com
```

**Retour:**
```json
{
  "domain": "google.com",
  "dns_records": { ... },
  "subdomains": [ "www.google.com", "mail.google.com", ... ],
  "ports": { "80": "open", "443": "open" },
  "ssl_cert": { "valid": true, "issuer": "Google" },
  "whois_data": { ... },
  "reputation": { "phishing": false, "malware": false }
}
```

### Exemple 2️⃣: Recherche Sociale d'un Utilisateur

```bash
ruby bin/multi_tools social elon
```

**Retour:** 🐦 Twitter trouvé | 🐙 GitHub trouvé | 📸 Instagram trouvé

### Exemple 3️⃣: Analyse d'Adresse IP

```bash
ruby bin/multi_tools ip 8.8.8.8
```

**Retour:**
- 🌍 Localisation: Mountain View, USA
- 🌐 ASN: AS15169 (Google)
- 🔓 Ports ouverts: 53, 443
- 🛡️ Réputation: Safe ✅

---

## ⚠️ Avertissements Légaux & Éthique

> ⚠️ **IMPORTANT** - Cet outil est destiné à des usages **légaux et autorisés uniquement**

### ✅ Utilisations Autorisées:
- ✔️ Pentesting autorisé
- ✔️ Recherche en sécurité
- ✔️ Bug bounty autorisé
- ✔️ Audit de sécurité
- ✔️ Recherche académique

### ❌ Utilisations Interdites:
- ❌ Hacking non autorisé
- ❌ Vol de données
- ❌ Accès non autorisé à des systèmes
- ❌ Harcelèment ou cyberstalking

**L'utilisation de cet outil pour accéder à des systèmes non autorisés est ILLÉGALE.**

---

## 🤝 Contribution

Les contributions sont bienvenues! 

```bash
# Fork le repo
git clone https://github.com/YOUR_USERNAME/multi_tools.git

# Créer une branche
git checkout -b feature/awesome-feature

# Commit vos changements
git commit -m "Add awesome feature ✨"

# Push
git push origin feature/awesome-feature

# Créer une PR
```

---

## 📊 Roadmap 🗺️

- [ ] 🔐 Support Metasploit intégré
- [ ] 🤖 Intégration AI/ML pour analyse
- [ ] 📊 Tableau de bord Web
- [ ] 📦 Distribution via Gem
- [ ] 🔄 Intégration CI/CD
- [ ] 🌍 Support multilingue
- [ ] 📱 Application mobile
- [ ] 🔌 Plugin système

---

## 📄 Licence

```
MIT License © 2026 soso2402
Libre d'utilisation avec attribution
```

Voir [LICENSE](LICENSE) pour plus de détails.

---

## 👤 Auteur & Contact

**Créé avec ❤️ par soso2402**

- 🐙 GitHub: [@soso2402](https://github.com/soso2402)
- 📧 Email: zorivfredeci@gmail.com
- 🌐 Site: [soso2402.com]

---

## 📈 Stats du Projet

[![GitHub stars](https://img.shields.io/github/stars/soso2402/multi_tools?style=social)](https://github.com/soso2402/multi_tools)
[![GitHub forks](https://img.shields.io/github/forks/soso2402/multi_tools?style=social)](https://github.com/soso2402/multi_tools)
[![GitHub watchers](https://img.shields.io/github/watchers/soso2402/multi_tools?style=social)](https://github.com/soso2402/multi_tools)

---

<div align="center">

### 🌟 **Si ce projet vous plaît, n'hésitez pas à le STAR sur GitHub!** 🌟

Made with ❤️ for the security community

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Security](https://img.shields.io/badge/Security-000000?style=for-the-badge&logo=security&logoColor=white)
![OSINT](https://img.shields.io/badge/OSINT-0078D4?style=for-the-badge)

</div>
