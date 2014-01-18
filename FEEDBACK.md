

die klassen wissen zu viel über die anderen klassen!

z.b. PieChart weiss wie @nutrients genau aufgebaut ist.




Feedback 
==================================
zur Präsentation und Code am 7.Jänner


Lieber Thomas, Liebe Franziska,

gratuliere zum tapferen Kampf mit den unhandlichen Daten,
ihr seid auf einem sehr guten weg, das wird ein gutes MMP2a.

Im Detail:

### Idee und Konzept 

* Status: das grosse passt, es ist euch gelungen die Idee umzusetzen. Jetzt geht's um's finalisieren und die Feinheiten.

### Code Qualität:

#### Architektur - Teil 0

Mit Mongo habt ihr euch viele Probleme für eine kleine Lösung
ins Haus geholt.  key/value hättet ihr auch in postgres oder mysql haben
können, aber dann hätte die ganze rails-welt noch normal funktioniert.

meine empfehlung: jetzt so lassen.

#### Architektur - Teil 1

ihr speichert die statischen seiten in der mongo-datenbank statt als views. 
da ist wohl der drupal/CMS - fan mit thomas durchgegangen: das ist für diese app eine
viel zu grosse lösung, da hätte ein pages_controller mit ein paar actions+views auch gereicht.

wenn man für ein komplexeres projekt so eine CMS-lösung macht muss man aber auch dafür
sorgen dass die statischen seiten, die für das fuktionieren der app / die installation auf einem
neuen produktions-server nötig sind auch in die datenbank kommen.  für relationale datenbanken
gibts dafür in rails die seeds.rb. 

ihr habt also die wahl:
a) umbau auf die einfache lösung mit pages_controller mit ein paar actions+views 
oder
b) ausbau der cms-lösung


meine empfehlung: a), umgesetzt von Franziska.

#### Architektur - Teil 2

das Laden aus den verschiedenen Datenquellen,
das speichern in der lokalen datenbank und das wieder abfragen der daten
ist stark ineinander vermischt.

ihr habt die wahl:
a) jetzt selbst refactoren
oder
b) so lassen, im sommersemester als beispiel für testen + refactoren verwenden

meine empfehlung: b)


#### REST und routes.rb 

* Status: scopes für mehrsprachigkeit, admin-namespace: da habt ihr wirklich fortgeschrittene sachen gemacht, bravo!

#### model

* Verbesserungesvorschlag: 
** siehe wiki seite plus
** piechart als model?  würde ich eher als helper sehen, so wie hier: http://railscasts.com/episodes/223-charts?view=asciicast

#### controller

* Status: seh ich da viel mehr actions, als wirklich urls aufgerufen werden?
* Verbesserungsvorschlag: alle actions löschen die nicht gebraucht werden, routes aufräumen (z.b. mit :only)
* Priorität: mittel

#### view

* Status: sehe ich da viel mehr views, als wirklich verwendet werden?
* Verbesserungsvorschlag: alle views löschen die nicht gebraucht werden
* Priorität: mittel

#### Asset Pipeline

* Status: passt

#### Tests

* Status: kaputt
* Verbesserungsvorschlag: 
** schreibt (mind. 2) Unit Tests für spannenden methoden in den Models 
** schreibt (mind. 1) Integrations Tests mit capistrano, die die wichigsn Funktionen der App OHNE Javascript testen
** schreibt (mind. 1) Integrations Tests mit poltergeist, die die wichigsn Funktionen der App MIT Javascript testen 
* Priorität: hoch

#### Code Conventions

ich hab euch eine .rubocop.yml datei ins git gegeben.
lasst mal rubocop -R laufen und schaut euch an welche
code conventions ihr nicht einhaltet.

(siehe auch hinweis in der peer-review im wiki bez. installation rubocpu und 2 oder 4 spaces indent)

* Status: einige verstöße gegen die code conventions
* Priorität: niedrig


### Teamarbeit als Programmier-Team

#### Git, gitignore

* Status: passt

#### Git, Commit Messages

* Status: ihr habt euch viel mühe mit den log-messages gegeben. passt.  Aber: hat wirklich nur Thomas gearbeitet?

### Resumé

ihr seit auf einem guten weg.  

ich hab ein bisschen den eindruck dass franziska nicht viel getan hat. 
vielleicht könnt ihr gegen diesen eindruck noch was tun.

lg
Brigitte


p.s. Und vergesst nicht auf die Darstellung im Portfolio!
