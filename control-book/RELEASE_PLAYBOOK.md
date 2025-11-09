# Release Playbook

## SemVer
- Версии формата MAJOR.MINOR.PATCH.
- Любой релиз сопровождается `CHANGELOG.md`.

## Артефакты релиза
- BuyerOnly ZIP (Per‑Doc Archive Mode, 5 файлов, верхний уровень).
- MANIFEST.yml и SHA256SUMS.txt на уровень релиза.
- Превью‑скрины (по требованию) и README/LICENSE.

## Процедура
1. Проверки (Vale, markdownlint) — CI должен быть зелёным.
2. Tag `vX.Y.Z` → workflow `release.yml` собирает релиз.
3. QA подтверждает Gate‑2.
4. Публикация.
