/-
Unified Verso manual: the three PQXDH model chapters in one `#doc`.

The deployed site (`scripts/render-docs-site.sh`, CI) renders each chapter as
its own manual and stitches the results together. Blueprint tooling that goes
through `lake exe vbp build` (probe-leanblueprint, `vbp check`, ...) needs a
single generator instead; `BlueprintMain.lean` at the package root renders this
document for that purpose. Both paths elaborate the same chapter modules, so
they agree on the Blueprint nodes: labels, kinds, Lean bindings, statuses and
dependencies. Section numbering and page links differ, since here the chapters
are parts of one manual.
-/
import VersoManual
import VersoBlueprint
import VersoBlueprint.Commands.Graph
import VersoBlueprint.Commands.Summary
import PQXDHDocs.Bibliography
import PQXDHDocs.Chapters.UAKE.Overview
import PQXDHDocs.Chapters.Spec.Overview
import PQXDHDocs.Chapters.Aeneas.Overview

open Verso.Genre
open Verso.Genre.Manual
open Informal

set_option doc.verso true

#doc (Manual) "PQXDH Models" =>
%%%
shortTitle := "PQXDH Models"
%%%

Formal verification of Signal's PQXDH key-agreement protocol in Lean 4, built
on top of [VCVio](https://github.com/Verified-zkEVM/VCV-io): a model of the
unilaterally authenticated key exchange (UAKE) security notion, a hand-written
model of the PQXDH specification, and two Aeneas-extracted models of the
LibSignal implementation, each instantiated as a UAKE scheme.

{blueprint_graph}

{blueprint_summary}

{include 0 PQXDHDocs.Chapters.UAKE.Overview}

{include 0 PQXDHDocs.Chapters.Spec.Overview}

{include 0 PQXDHDocs.Chapters.Aeneas.Overview}
