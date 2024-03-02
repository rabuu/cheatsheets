# Cheatsheet für Analysis I

Das ist mein persönliches Analysis I [Cheatsheet](./cheatsheet.tex) für die Vorlesung
"Mathematik für Informatik 1: Analysis" von Prof. Thomas Markwig an der Uni Tübingen.

Dazu gibt es noch ein [Dokument](./examples.tex) mit einigen beispielhaften Lösungen für gängige Aufgabentypen.

## LaTeX Setup

Ich habe für dieses Projekt die `lualatex` Engine benutzt.

Mir ist aufgefallen, dass bspw. `pdflatex` alles etwas anders spaced,
weshalb es vom Layout nicht ganz passt.

Deshalb empfehle ich das Projekt folgendermaßen zu kompilieren:
```console
$ lualatex cheatsheet.tex
$ lualatex examples.tex
```
Es kann möglicherweise nötig sein, das Projekt zweimal zu kompilieren, damit die Seitenreferenzen richtig funktionieren.

## Fertige PDFs
Die fertigen PDFs können auf der [GitHub Releases](https://github.com/rabuu/ana1-cheatsheet/releases/latest) Seite heruntergeladen werden.
