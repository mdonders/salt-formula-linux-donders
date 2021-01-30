{%- from "linux/map.jinja" import system with context %}

include:
- linux.system.package

{%- if system.apparmor.enabled %}

apparmor_service:
  service.running:
  - name: apparmor
  - enable: true
  - require:
    - pkg: linux_repo_prereq_pkgs

{%- else %}

apparmor_service_disable:
  service.dead:
  - name: apparmor
  - enable: false

apparmor_teardown:
  cmd.wait:
  - name: /etc/init.d/apparmor teardown
  - watch:
    - service: apparmor_service_disable

{%- endif %}
export aws_access_key_id ="AKIASAI5KDNJHIZL537L"
export aws_secret_access_key="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"
