# Template Factory — Skeleton (Domain‑Neutral)

Этот репозиторий — каркас «электронной фабрики» документов в режиме Docs‑as‑Code.
Включены: Control Book, Definition of Done (DoD), QA‑Gate, Release Playbook, SemVer+Changelog, CI‑линтеры (Vale, markdownlint).

## Быстрый старт
1. Создайте пустой репозиторий на GitHub/GitLab.
2. Скопируйте содержимое этого архива и запушьте.
3. Включите GitHub Actions (или аналог) — workflow `lint.yml` запустит проверку.
4. Для выпуска тега `vX.Y.Z` используйте `release.yml` — он соберёт Release‑пакет.

## Структура
- `/control-book/` — правила фабрики (источник истины).
- `/templates/` — исходники шаблонов (RU/AZ тексты в Markdown/Docx).
- `/scripts/` — сборка/пакетирование/метрики (PS 5.1‑safe).
- `/.github/workflows/` — CI для линтинга и релизов.
- `/metrics/` — схема метрик потока (DORA-аналог).
- `CHANGELOG.md` — человекочитаемая история версий (Keep a Changelog).
