# dental-school-education-live-proof

Test-only separates Projekt-Repo fuer einen realistischen Real-Domain-Proof auf
`coolify-01` mit:

- `dental-school.education`
- `www.dental-school.education`

## Charakter

- `lifecycle.mode: live`
- oeffentlich
- stateless
- Coolify `dockerfile`
- keine Datenbank
- keine Runtime-Secrets
- einfache Landingpage mit eindeutiger Marker-Zeile
- test-only Real-Domain-Proof, nicht automatisch dauerhaftes Live-Projekt

## Zweck

Dieses Repo ist **kein** generisches Template und **kein** kanonisches
sanitisiertes Beispiel. Es ist der konkrete Beweisfall fuer einen realistischen
oeffentlichen Domain-Test mit einer echten Hetzner-Domain.

## Erfolgsbegriff

Der Lauf ist erfolgreich, wenn:

- Coolify den gepinnten Git-Commit baut
- der Container stabil laeuft
- `dental-school.education` und `www.dental-school.education` per `A` auf
  `coolify-01` zeigen
- HTTP/HTTPS oeffentlich funktionieren
- die Seite den Marker
  `DENTAL-SCHOOL-EDUCATION-LIVE-PROOF OK`
  liefert

## Nicht Teil dieses Repos

- Host-Runbooks
- globale Firewall-/SSH-/Backup-Doku
- Mail-/DNS-Gesamtverwaltung fuer die Domain

## Wichtige Regel

Mail- und andere Nicht-Web-Records der Domain bleiben ausserhalb dieses Repos
und werden im Host-Repo dokumentiert. Dieses Repo beschreibt nur den
Website-Pfad.

## Aktueller Referenzstand

- GitHub-Proof-Commit:
  - `8ccb1f7ac8a9577395691f293da862a016ed1de3`
- aktueller Status:
  - `live proof, test-only, retained`

## Reale Feldlehren aus diesem Proof

- das Coolify-Domains-Feld musste als volle URL-Liste gesetzt werden:
  - `https://dental-school.education,https://www.dental-school.education`
- blanke Hostnamen ohne Schema fuehrten auf diesem Host zu kaputten
  Traefik-Regeln
- fuer den ersten Webproof wurden die `AAAA`-Records fuer Apex und `www`
  bewusst entfernt
- der erste ACME-Lauf scheiterte trotzdem noch an einem oeffentlich gecachten
  alten `AAAA`-Pfad auf das fruehere Webhosting
- nachdem oeffentliche Resolver kein `AAAA` mehr lieferten, reichte ein
  gezielter Neustart von `coolify-proxy`, damit HTTPS sauber ausgestellt wurde
- die Seite setzt zusaetzlich bewusst Anti-Indexierungs-Signale:
  - `robots.txt` mit `Disallow: /`
  - HTML-Meta `noindex,nofollow,noarchive,noimageindex,nosnippet`
  - HTTP-Header `X-Robots-Tag` mit denselben Direktiven
