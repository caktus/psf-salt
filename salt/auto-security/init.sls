unattended-upgrades:
  pkg.installed


# Originally this file was used, however it was moved to 10periodic to make it
# more clear that it is configuring the APT::Periodic and not the actual
# automated upgrades.
/etc/apt/apt.conf.d/20auto-upgrades:
  file.absent


/etc/apt/apt.conf.d/10periodic:
  file.managed:
    - source: salt://auto-security/config/10periodic
    - user: root
    - group: root
    - mode: 644


/etc/apt/apt.conf.d/50unattended-upgrades:
  file.managed:
    - source: salt://auto-security/config/50unattended-upgrades
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: unattended-upgrades
