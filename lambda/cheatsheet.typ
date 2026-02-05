#import "../layout.typ": *
#import "@preview/curryst:0.6.0": *

#show: layout.with(title: "λ-Kalkül und Kombinatorische Logik")

#show math.equiv: math.scripts
#show math.eq: math.scripts

#let rel(r) = math.class("relation", r)

#let id = rel("≏")
#let idef = rel(":≏")

#let FV = "FV"

#let al1 = rel($equiv_(1 alpha)$)
#let al = rel($equiv_alpha$)
#let be1 = rel($triangle.r_(1 beta)$)
#let be1-rev = rel($triangle.l_(1 beta)$)
#let be = rel($triangle.r_beta$)
#let beq = rel($eq_beta$)
#let eta1 = rel($triangle.r_(1 eta)$)
#let be-eta = rel($triangle.r_(beta eta)$)
#let beq-eta = rel($eq_(beta eta)$)
#let weak1 = rel($triangle.r_(1 w)$)
#let weak = rel($triangle.r_w$)
#let weakeq = rel($eq_w$)

#let num = math.underline

#let combinator(k) = math.class("unary", math.bold(k))
#let KN = combinator("N")
#let KV = combinator("V")
#let KD = combinator("D")
#let KR = combinator("R")
#let KK = combinator("K")
#let KS = combinator("S")
#let KI = combinator("I")
#let KY = combinator("Y")
#let KTH = combinator(math.Theta)

= λ-Kalkül

== Syntax
$x quad | quad (M space N) quad | quad (lambda x. M)$

== Substitution
+ $x[N\/x] idef N$
+ $a[N\/x] idef a$, falls $x eq.not a$
+ $(P Q)[N\/x] idef (P[N\/x] Q[N\/x])$
+ $(lambda x.P)[N\/x] idef lambda x.P$
+ $(lambda y.P)[N\/x] idef lambda y.P[N\/x]$,\ falls $x eq.not y$ und nicht: $y in FV(N)$ und $x in FV(P)$.
+ $(lambda y.P)[N\/x] idef lambda z.P[z\/y][N\/x]$, $z in.not FV(N P)$.

== α-Konversion
$P[lambda x.M] al1 P[lambda y.M[y\/x]]$, $y in.not FV(M)$

$P al Q quad :<==> quad P al1 ... al1 Q$

=== Einige Lemmata
- $z in.not FV(M) => M[z\/x][P\/z] al M[P\/x]$
- $z in.not FV(M) => M[z\/x][x\/z] al M$
- $M[Q\/x][P\/x] al M[(Q[P\/x])\/x]$
- $y in.not FV(P)$\
  $=> M[Q\/y][P\/x] al M[P\/x][(Q[P\/x])\/y]$
- $y in.not FV(P), x in.not FV(Q)$\
  $=> M[Q\/y][P\/x] al M[P\/x][Q\/y]$

== β-Kontraktion
$P[(lambda x.M)N] be1 P[M[N\/x]]$

$P be Q :<==> P #stack(be1, al1) ... #stack(be1, al1) Q$

$P beq Q :<==> P #stack(be1, be1-rev, al1) ... #stack(be1, be1-rev, al1) Q$

== Church-Rosser-Theorem
$P be M and P be N ==> exists T: M be T and N be T$

$M beq N ==> exists T: M be T and N be T$

#colbreak()

== Reduktionsfolgen

=== β-Reduktionsfolge
$(M_1, M_2, ...)$, wobei $M_1 be1 M_2 be1 ...$

=== L-Reduktionsfolge
$beta$-Reduktionsfolge, bei der _immer_ das linkeste Redex kontrahiert wird.

=== QL-Reduktionsfolge
$beta$-Reduktionsfolge, bei der "immer wieder" das linkeste Redex kontrahiert wird.

== Normalisierbarkeit

$P$ ist in β-Normalform $:<==>$ $P$ enthält kein β-Redex

$P$ normalisierbar $:<==>$ $P$ hat eine β-NF

$P$ stark normalisierbar\ $:<==>$ es gibt keine unendliche β-RF von $P$

$M$ hat eine β-Normalform\
$==>$ jede L/QL-Reduktionsfolge $(M,...)$ terminiert

Um Normalisierbarkeit eines Terms zu widerlegen:
Zeige, dass L-Reduktionsfolge nicht terminiert.

== Fixpunktkombinatoren
$Y x beq x(Y x) quad$ bzw. $quad Y x be x(Y x)$

$KY idef lambda x. (lambda y. x (y y)) (lambda y. x (y y))$

$KTH idef (lambda z x. x (z z x))(lambda z x. x (z z x))$

$forall N: exists M: forall n >= 0: M y_1 ... y_n beq N[M\/x]$

=== Beispiel
_Finde P, so dass $P M N O be P O N M$._

Sei $F idef lambda p m n o. p o n m$.
Setze $P idef KTH F$.

Dann $P m n o id KTH F m n o be F P m n o be P o n m$.

== η-Kontraktion
$P[lambda x.M x] eta1 P[M]$, $quad x in.not FV(M)$

Erweitere $be$ und $beq$ um η-Kontr. für #be-eta bzw. #beq-eta.

#colbreak()

= λ-Def.barkeit rek. Funktionen

== Church-Ziffern
$num(0) idef lambda x y.y, quad num(1) idef lambda x y. x y, quad num(2) idef lambda x y. x(x y), quad ...$

- $KN num(k) beq num(k+1)$
- $KV num(k+1) beq num(k)$
- $KD P Q num(0) beq P quad KD P Q num(k+1) beq Q$
- $KR P Q num(0) beq P quad KR P Q num(k+1) beq Q num(k) (KR P Q num(k))$

== Primitiv-rekursive Funktionen
+ $0 : NN^0 -> NN$
+ $s: NN -> NN$ mit $s(m) = m + 1$
+ $pi^n_i : NN^n -> NN$ mit $pi^n_i (arrow(m_n)) = m_i$, $n >= 1, i <= n$
+ $f: NN^n -> NN$ mit $f(arrow(m_n)) = h(g_1(arrow(m_n)),...,g_k (arrow(m_n)))$,\
  $h: NN^k -> NN$ und alle $g_i: NN^n -> NN$ prim.rek.
+ $f: NN^(k+1) -> NN$ mit $f(0, arrow(m_k)) = g(arrow(m_k))$\
  und $f(n+1, arrow(m_k)) = h(n, f(n, arrow(m_k)), arrow(m_k))$,\
  $g: NN^k -> NN$ und $h:NN^(k+2) -> NN$ prim.rek., $k >= 0$

=== λ-Übersetzung
+ $num(0)$
+ $KN$
+ $lambda x_1 ... x_n. x_i$
+ $lambda arrow(x). P (Q_1 arrow(x)) ... (Q_k arrow(x))$, wobei $h mapsto P$, $g_i mapsto Q_i$
+ $lambda u arrow(x). KR (P arrow(x)) (lambda u v. Q u v arrow(x)) u$, wobei $g mapsto P$, $h mapsto Q$

== Partiell-rekursive Funktionen
$g, h$ prim.rek. \
$f(arrow(m)) = h(mu k. g(arrow(m), k) = 0)$ partiell rekursiv.

Dabei $mu k. g(arrow(m), k) = 0$:
- das kleinste $k$, so dass $g(arrow(m), k) = 0$,
- undefiniert, falls kein solches $k$ existiert.

λ-Term $<==>$ partiell-rekursive Funktion

#colbreak()

= Formale Theorien λβ / λβη

#stack(
  dir: ltr,
  prooftree(rule(label: [(α)], $lambda x.M = lambda y.M[y\/x]$)),
  [, $space y in.not FV(M)$],
)
#stack(
  dir: ltr,
  spacing: 1fr,
  prooftree(rule(label: [(β)], $(lambda x.M)N = M[N\/x]$)),
  prooftree(rule(label: [(ρ)], $M = M$)),
)
#stack(
  dir: ltr,
  spacing: 1fr,
  prooftree(dir: ttb, rule(label: [(σ)], $M = N$, $N = M$)),
  prooftree(rule(label: [(τ)], $M = N$, $N = P$, $M = P$)),
)
#stack(
  dir: ltr,
  spacing: 1fr,
  prooftree(rule(label: [(μ)], $N = N'$, $M N = M N'$)),
  prooftree(rule(label: [(ν)], $M = M'$, $M' N = M' N$)),
)
#stack(
  dir: ltr,
  spacing: 1fr,
  prooftree(rule(label: [(ξ)], $M = M'$, $lambda x.M = lambda x.M'$)),
  stack(
    dir: ltr,
    prooftree(rule(label: [(η)], $lambda x.M x = M$)),
    [, $space x in.not FV(M)$],
  ),
)

== Abwandlungen
#grid(
  columns: 2,
  column-gutter: 2em,
  row-gutter: 1em,
  [ λβ: ohne (η) ], [ $λ β_triangle.r$: ohne (η) (σ) ],
  [ λβη: alles ], [ $λ β η_triangle.r$: ohne (σ) ],
)

== Korrektheit und Vollständigkeit
$
  M & be N       & <==> & "λβ"_triangle.r  & tack & M = N \
  M & #be-eta N  & <==> & "λβη"_triangle.r & tack & M = N \
  M & beq N      & <==> & "λβ"             & tack & M = N \
  M & #beq-eta N & <==> & "λβη"            & tack & M = N
$

== Alternative Regeln für Extensionalität
#prooftree(rule(label: [(χ)], [$M P = N P$ für alle $P$], $M = N$))
#stack(
  dir: ltr,
  prooftree(rule(label: [(ζ)], $M x = N x$, $M = N$)),
  [, $space x in.not FV(M N)$],
)

(η) kann gegen eine der beiden ausgetauscht werden.

#colbreak()

= Unentscheidbarkeitsresultate
- $"NF"_beta := {M | M "hat β-NF"}$
- $beq$
- Prädikatenlogik erster Stufe PL

= Kombinatorische Logik

== Syntax
$x quad | quad KK quad | quad KS quad | quad (X space Y)$

== Schwache Kontraktion
$U[KK X Y] weak1 U[X]$

$U[KS X Y Z] weak1 U[X Z (Y Z)]$

== Formale Theorie CLw
#stack(
  dir: ltr,
  spacing: 1em,
  prooftree(rule(label: [(K)], $KK X Y = X$)),
  prooftree(rule(label: [(S)], $KS X Y Z = X Z (Y Z)$)),
)

Dazu: (ρ), (τ), (μ), (ν), (σ)

Für $"CLw"_triangle.r$: ohne (σ)

=== Korrektheit und Vollständigkeit
$
  X & weakeq Y & <==> & "CLw"            & tack & X = Y \
  X & weak Y   & <==> & "CLw"_triangle.r & tack & X = Y \
$

#colbreak()

= Verhältnis zw. λ-Kalk. und CL

== CL $arrow.squiggly$ λ
+ $x_lambda idef x$
+ $KK_lambda idef lambda x y.x$
+ $KS_lambda idef lambda x y z. x z (y z)$
+ $(X Y)_lambda idef X_lambda Y_lambda$

$X weak Y ==> X_lambda be Y_lambda quad X weakeq Y ==> X_lambda beq Y_lambda$

== λ $arrow.squiggly$ CL
+ $x_"CL" idef x$
+ $(M N)_"CL" idef M_"CL" N_"CL"$
+ $(lambda x.M)_"CL" idef [x].M_"CL"$, wobei:
  + $[x].x idef KS KK KK$
  + $[x].Y idef KK Y$, falls $x in.not FV(Y)$
  + $[x].U x idef U$, falls $x in.not FV(U)$
  + $[x].(U V) idef KS([x].U)([x].V)$, sonst.

  $([x].Y) Z weak Y[Z\/x]$

  $(X_lambda)_"CL" id X$

  $(M_"CL")_lambda #beq-eta M$

== Kombinatorische Vollständigkeit
$V$ mit ${x_1, ..., x_n} subset.eq FV(V)$

Dann existiert $U$, in dem $x_1, ..., x_n$ nicht vorkommen, so dass:
$U X_1 ... X_n weak V[X_1\/x_1]...[X_n\/x_n]$

== Unterschiede
Folgendes gilt _nicht_:
$
  M_"CL" & weak   & N_"CL" & ==> &  M be N \
  M_"CL" & weak   & N_"CL" & <== &  M be N \
  M_"CL" & weakeq & N_"CL" & ==> & M beq N \
  M_"CL" & weakeq & N_"CL" & ==> & M beq N \
$

#colbreak()

= Einfach getypter λ-Kalkül

== Kalkül λ$->$
#prooftree(rule(label: [(Id)], $Gamma, x:sigma tack x: sigma$))
#prooftree(rule(label: [($->$I)], $Gamma, x:sigma tack M: tau$, $Gamma tack (lambda x.M): sigma -> tau$))
#prooftree(rule(label: [($->$E)], $Gamma tack M: sigma -> tau$, $Gamma tack N: sigma$, $Gamma tack (M N) : tau$))

$Gamma tack M:sigma ==> M$ ist stark normalisierbar.

== Typisierungsalgorithmus
=== Gleichungssystem $E(Gamma tack M: sigma)$:

$E(Gamma tack x:sigma) := {sigma = Gamma(x)}$

$E(Gamma tack lambda x.M : sigma) := \ quad quad {sigma = alpha -> beta} union E(Gamma, x:alpha tack M: beta)$

$E(Gamma tack M N : sigma) := \ quad quad E(Gamma tack M: alpha -> sigma) union E(Gamma tack N: alpha)$

=== Unifikationsregeln:
#prooftree(rule(label: [(id)], $E union.dot {sigma = sigma}$, $E$))
#prooftree(rule(label: [(sym)], $E union.dot {sigma = alpha}$, [$sigma$ keine Typvariable], $E union {alpha = sigma}$))
#prooftree(rule(label: [(fail)], $E union.dot {alpha = sigma}$, [$alpha$ in $sigma$], [FAIL]))
#prooftree(rule(
  label: [(subst)],
  $E union.dot {alpha = sigma}$,
  [$alpha$ nicht in $sigma$],
  [$alpha$ in $E$],
  $E[sigma\/alpha] union {alpha = sigma}$,
))
#prooftree(rule(
  label: [(func)],
  $E union.dot {tau_1 -> tau_2 = sigma_1 -> sigma_2}$,
  $E union {tau_1 = sigma_1, tau_2 = sigma_2}$,
))

#colbreak()

= Curry-Howard-Isomorphismus

== Kalkül P$->$
#align(center, prooftree(rule(label: [(Id)], $Delta, sigma tack sigma$)))
#stack(
  dir: ltr,
  spacing: 1fr,
  prooftree(rule(label: [($->$I)], $Delta, sigma tack tau$, $Delta tack sigma -> tau$)),
  prooftree(rule(label: [($->$E)], $Delta tack sigma -> tau$, $Delta tack sigma$, $Delta tack tau$)),
)

= Polymorph getypter λ-Kalkül

== Kalkül λ2
Zusätzlich zu λ$->$:
#prooftree(rule(
  label: [($forall$I)],
  $Gamma tack M:sigma$,
  $alpha in.not FV(Gamma)$,
  $Gamma tack M: forall alpha . sigma$,
))
#prooftree(rule(label: [($forall$E)], $Gamma tack M: forall alpha . sigma$, $Gamma tack M: sigma[tau\/alpha]$))
