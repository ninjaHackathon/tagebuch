# Ernährungstagebuch

Eine Web-App für die Stillzeit: Du trägst täglich die Symptome deines Babys, deine
Ernährung und deine Nahrungsergänzungsmittel (NEM) ein. Die Analyse vergleicht Tage
nach dem Verzehr eines Lebensmittels (bis 72 h nachwirkend) mit Tagen ohne und zeigt
mögliche Auslöser. Alles läuft in einer einzigen Datei (`index.html`) — kein Build nötig.

## Funktionen

- Erst-Setup mit Kind-Profil (Name, Geschlecht, Geburtsdatum) und Auswahl der Symptome, Lebensmittel und NEM
- Tages-Editor mit Schweregrad-Slidern, Chips und Notiz; Verlauf als Übersichts-Matrix; Analyse-Tab
- Alle Listen bearbeitbar: umbenennen, löschen, ausblenden (Daten bleiben), Reihenfolge ändern
- CSV-Export/-Import
- Optional: Login mit E-Mail + Passwort und Daten-Sync über Supabase (siehe unten)

## Supabase-Login einrichten (optional)

Ohne Konfiguration läuft die App rein lokal (Daten im Browser-Speicher, kein Login).
Für Login + Sync auf mehreren Geräten:

1. Gratis-Projekt auf [supabase.com](https://supabase.com) erstellen
2. Im Dashboard unter **Authentication → Sign In / Up → Email** sicherstellen, dass
   **„Confirm email"** aktiviert ist (das ist das Double-Opt-In: Registrierung erst
   nach Klick auf den Bestätigungslink in der E-Mail gültig)
3. Unter **SQL Editor** den Inhalt von [`supabase-setup.sql`](supabase-setup.sql)
   ausführen (legt die Tabelle `journals` mit Row Level Security an)
4. Unter **Project Settings → API** die **Project URL** und den **anon public** Key
   kopieren und in `index.html` ganz oben bei `SUPABASE_URL` / `SUPABASE_ANON_KEY`
   eintragen (Suche nach `<<HIER EINTRAGEN>>`)
5. Seite neu laden — jetzt erscheint der Anmelde-Screen

Hinweise:
- Der eingebaute E-Mail-Versand von Supabase reicht zum Testen; für den Dauerbetrieb
  empfiehlt Supabase einen eigenen SMTP-Server (Authentication → Emails → SMTP)
- Es wird nur der **anon public** Key eingetragen — niemals der `service_role`-Key
