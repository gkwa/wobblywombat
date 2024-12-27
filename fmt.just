set shell := ["bash", "-uec"]

[group('maint')]
default:
    @just --list

[group('maint')]
pre-commit:
    curl -O https://raw.githubusercontent.com/gkwa/manyeast/refs/heads/master/prettier/.pre-commit-config.yaml
    pre-commit install --config .pre-commit-config.yaml
    pre-commit autoupdate
    git add .pre-commit-config.yaml
    pre-commit run --all-files

[group('maint')]
fmt:
    pre-commit run --all-files