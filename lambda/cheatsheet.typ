#import "../layout.typ": *
#import "@preview/curryst:0.6.0": *

#show: layout.with(title: "λ-Kalkül und Kombinatorische Logik")

#show math.equiv: math.scripts
#show math.eq: math.scripts

#let FV = "FV"
#let al1 = $equiv_(1 alpha)$
#let al = $equiv_alpha$
#let be1 = math.class("relation", $triangle.r_(1 beta)$)
#let be1-rev = math.class("relation", $triangle.l_(1 beta)$)
#let be = math.class("relation", $triangle.r_beta$)
#let beq = math.class("relation", $eq_beta$)
#let eta1 = math.class("relation", $triangle.r_(1 eta)$)
#let be-eta = math.class("relation", $triangle.r_(beta eta)$)
#let beq-eta = math.class("relation", $eq_(beta eta)$)
#let num = math.underline

#let KN = math.class("unary", math.bold("N"))
#let KV = math.class("unary", math.bold("V"))
#let KD = math.class("unary", math.bold("D"))
#let KR = math.class("unary", math.bold("R"))

= λ-Kalkül

== Syntax
TODO?

== Substitution
+ $x[N\/x] := N$
+ $a[N\/x] := a$, falls $x eq.not a$
+ $(P Q)[N\/x] := (P[N\/x] Q[N\/x])$
+ $(lambda x.P)[N\/x] := lambda x.P$
+ $(lambda y.P)[N\/x] := lambda y.P[N\/x]$,\ falls $x eq.not y$ und nicht: $y in FV(N)$ und $x in FV(P)$.
+ $(lambda y.P)[N\/x] := lambda z.P[z\/y][N\/x]$, $z in.not FV(N P)$.

== α-Konversion
$P[lambda x.M] al1 P[lambda y.M[y\/x]]$, $y in.not FV(M)$

$P al Q :<==> P al1 ... al1 Q$

=== Einige Lemmata
TODO?

== β-Kontraktion
$P[(lambda x.M)N] be1 P[M[N\/x]]$

$P be Q :<==> P #stack(be1, al1) ... #stack(be1, al1) Q$

$P beq Q :<==> P #stack(be1, be1-rev, al1) ... #stack(be1, be1-rev, al1) Q$

== Church-Rosser-Theorem
$P be M and P be N ==> exists T: M be T and N be T$

$M beq N ==> exists T: M be T and N be T$

== L- und QL-Reduktionsfolgen
TODO

$M$ hat β-NF $==>$ jede mit $M$ beginnende L-Reduktionsfolge terminiert.

== Fixpunktkombinatoren
$Y x beq x(Y x) quad$ bzw. $quad Y x be x(Y x)$

TODO: Konkrete Terme

$forall N: exists M: forall n >= 0: M y_1 ... y_n beq N[M\/x]$

== η-Kontraktion
$P[lambda x.M x] eta1 P[M]$, $quad x in.not FV(M)$

= λ-Def.barkeit rek. Funktionen

== Church-Ziffern
$num(0) = lambda x y.y, quad num(1) = lambda x y. x y, quad num(2) = lambda x y. x(x y), quad ...$

- $KN num(k) beq num(k+1)$
- $KV num(k+1) beq num(k)$
- $KD P Q num(0) beq P quad KD P Q num(k+1) beq Q$
- $KR P Q num(0) beq P quad KR P Q num(k+1) beq Q num(k) (KR P Q num(k))$

== Primitiv-rekursive Funktionen
TODO

== Partiell-rekursive Funktionen
TODO

= Formale Theorien λβ / λβη

#stack(
  dir: ltr,
  prooftree(rule(label: [(α)], $lambda x.M = lambda y.M[y\/x]$)),
  [, $space y in.not FV(M)$],
)
#stack(
  dir: ltr,
  spacing: 1em,
  prooftree(rule(label: [(β)], $(lambda x.M)N = M[N\/x]$)),
  prooftree(rule(label: [(ρ)], $M = M$)),
)
#stack(
  dir: ltr,
  spacing: 2em,
  prooftree(dir: ttb, rule(label: [(σ)], $M = N$, $N = M$)),
  prooftree(rule(label: [(τ)], $M = N$, $N = P$, $M = P$)),
)
#stack(
  dir: ltr,
  spacing: 2em,
  prooftree(rule(label: [(μ)], $N = N'$, $M N = M N'$)),
  prooftree(rule(label: [(ν)], $M = M'$, $M' N = M' N$)),
)
#stack(
  dir: ltr,
  spacing: 0.5em,
  prooftree(rule(label: [(ξ)], $M = M'$, $lambda x.M = lambda x.M'$)),
  stack(
    dir: ltr,
    prooftree(rule(label: [(η)], $lambda x.M x = M$)),
    [, $space x in.not FV(M)$],
  ),
)

== Abwandlungen
$λ β_triangle.r$: ohne (η) (σ)
#h(2.2em)
λβ: ohne (η)

$λ β η_triangle.r$: ohne (σ)
#h(3em)
λβη: alles

== Korrektheit und Vollständigkeit
$
  M & be N       & <==> & "λβ"_triangle.r  & tack & M = N \
  M & #be-eta N  & <==> & "λβη"_triangle.r & tack & M = N \
  M & beq N      & <==> & "λβ"             & tack & M = N \
  M & #beq-eta N & <==> & "λβη"            & tack & M = N
$

= Unentscheidbarkeitsresultate
- $"NF"_beta := {M | M "hat β-NF"}$
- $beq$
- Prädikatenlogik erster Stufe PL

= Kombinatorische Logik

== Syntax
TODO

== Schwache Kontraktion
TODO

== Formale Theorie CLw
TODO

= Verhältnis zw. λ-Kalk. und CL

== CL $arrow.squiggly$ λ
TODO

== λ $arrow.squiggly$ CL
TODO

== Kombinatorische Vollständigkeit
TODO

== Unterschiede
TODO

= Einfach getypter λ-Kalkül

== λ$->$
TODO

== Typisierungsalgorithmus
TODO

= Curry-Howard-Isomorphismus
TODO

= Polymorph getypter λ-Kalkül

== λ2
TODO
