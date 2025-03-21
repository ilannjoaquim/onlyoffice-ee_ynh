<!--
N.B.: This README was automatically generated by <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
It shall NOT be edited by hand.
-->

# OnlyOffice for YunoHost

[![Integration level](https://apps.yunohost.org/badge/integration/onlyoffice)](https://ci-apps.yunohost.org/ci/apps/onlyoffice/)
![Working status](https://apps.yunohost.org/badge/state/onlyoffice)
![Maintenance status](https://apps.yunohost.org/badge/maintained/onlyoffice)

[![Install OnlyOffice with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=onlyoffice)

*[Read this README in other languages.](./ALL_README.md)*

> *This package allows you to install OnlyOffice quickly and simply on a YunoHost server.*  
> *If you don't have YunoHost, please consult [the guide](https://yunohost.org/install) to learn how to install it.*

## Overview

ONLYOFFICE Document Server is an online office suite comprising viewers and editors for texts, spreadsheets and presentations, fully compatible with Office Open XML formats: .docx, .xlsx, .pptx and enabling collaborative editing in real time.

Online collaborative edition of ONLYOFFICE documents requires: 
1. a server part, with two installation options:
   1. ONLYOFFICE Document Server packaged for YunoHost. 
   2. The [Community Document Server for Nextcloud](https://apps.nextcloud.com/apps/documentserver_community) 

2. a client part, such as: 
   1. The [ONLYOFFICE connector for Nextcloud](https://apps.nextcloud.com/apps/onlyoffice) 
   2. The [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)

A solution made easy by YunoHost is to install (1.i) and (2.i), see [section below](https://github.com/YunoHost-Apps/onlyoffice_ynh/#configuration-of-onlyoffice-server). The Nextcloud addicts may follow [this tutorial](https://github.com/YunoHost-Apps/nextcloud_ynh#configure-onlyoffice-integration) to install (1.ii) and (2.i) on one Nextcloud instance. However, performance and architecture are limited.


**Shipped version:** 8.3.1~ynh1

**Demo:** <https://www.onlyoffice.com/fr/download-desktop.aspx>

## Screenshots

![Screenshot of OnlyOffice](./doc/screenshots/01-presentation.jpg)
![Screenshot of OnlyOffice](./doc/screenshots/02-document-short.png)

## Documentation and resources

- Official app website: <https://www.onlyoffice.com>
- Upstream app code repository: <https://github.com/ONLYOFFICE/DocumentServer>
- YunoHost Store: <https://apps.yunohost.org/app/onlyoffice>
- Report a bug: <https://github.com/YunoHost-Apps/onlyoffice_ynh/issues>

## Developer info

Please send your pull request to the [`testing` branch](https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing).

To try the `testing` branch, please proceed like that:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
or
sudo yunohost app upgrade onlyoffice -u https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>
