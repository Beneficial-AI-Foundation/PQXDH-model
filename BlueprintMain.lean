import PQXDHDocs.Render
import PQXDHDocs.Contents

/-!
Verso Blueprint generator entry point.

`lake exe vbp build` (the standard Verso Blueprint render command, and the
default used by tools such as `probe-leanblueprint`) discovers a generator by
looking for `BlueprintMain.lean` (among a few conventional names) at the
package root. This file is that entry point: it renders the unified manual
`PQXDHDocs.Contents` through `PQXDHDocs.renderManual`, which wraps
`PreviewManifest.blueprintMainWithPreviewData`, exactly like the per-chapter
runners under `docs/PQXDHDocs/Renderers/`.

`scripts/render-docs-site.sh` remains the deployed site build (per-chapter
manuals, landing page, Blueprint status table, progress chart); this entry
point only produces the unified manual and its `blueprint-manifest.json`
under `_out/site`.
-/

def main (args : List String) : IO UInt32 :=
  PQXDHDocs.renderManual (%doc PQXDHDocs.Contents) args
