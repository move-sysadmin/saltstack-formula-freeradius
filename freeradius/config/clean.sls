# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as freeradius with context %}

include:
  - {{ sls_service_clean }}

freeradius-config-clean-file-absent:
  file.absent:
    - name: {{ freeradius.config }}
    - require:
      - sls: {{ sls_service_clean }}
