# elm-enum

> A library to facilitate using Elm union types as `Enum`s

This module came out of [this Discourse discussion](https://discourse.elm-lang.org/t/how-to-do-enums-in-elm/1353)

- OP
  - https://discourse.elm-lang.org/u/chingwa

- Contributors
  - https://discourse.elm-lang.org/u/rupert
  - https://discourse.elm-lang.org/u/joelq
  - https://discourse.elm-lang.org/u/mfeineis
  - https://discourse.elm-lang.org/u/rgrempel

In the original discussion, there was concern about putting a function in the record, with the potential for having a function in the model and thereby causing serialization issues.
In the admittedly simple example project included, the Enum never had a reason to be in the model.


[![Travis-CI build Status](https://travis-ci.org/genthaler/elm-enum.svg?branch=master)](https://travis-ci.org/genthaler/elm-enum)

[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/tn79mfap9v0fg2qb/branch/master?svg=true)](https://ci.appveyor.com/project/genthaler/elm-enum/branch/master)

[![Dependency CI Status](https://dependencyci.com/github/genthaler/elm-enum/badge?style=flat)](https://dependencyci.com/github/genthaler/elm-enum/badge?style=flat)

[![](https://raw.githubusercontent.com/ZenHubIO/support/master/zenhub-badge.png)](https://zenhub.com)
