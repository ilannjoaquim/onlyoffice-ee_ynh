#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

_install_msfonts_deb() {
    
    # Do not replace app dependencies
    YNH_INSTALL_APP_DEPENDENCIES_REPLACE="false"

    # Run this here because it's less verbose for some reason
    ynh_exec_warn_less ynh_install_extra_app_dependencies \
        --repo="deb http://deb.debian.org/debian/ $(lsb_release --codename --short) main contrib" \
        --key="https://ftp-master.debian.org/keys/release-$(lsb_release --release --short).asc" \
        --package="ttf-mscorefonts-installer" 
}

_install_onlyoffice_deb() {
    echo "⚙️ Configuration de la base de données pour OnlyOffice EE..."

    # Préparer la configuration de PostgreSQL
    echo onlyoffice-documentserver-ee onlyoffice/ds-port select "$port" | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/db-host string 127.0.0.1 | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/db-user string "$db_user" | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/db-pwd password "$db_pwd" | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/db-name string "$db_name" | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/jwt-secret password "$jwt_secret" | debconf-set-selections

    # Ajouter la clé GPG OnlyOffice EE
    echo "🔑 Ajout de la clé GPG OnlyOffice EE..."
    mkdir -p -m 700 ~/.gnupg
    curl -fsSL https://download.onlyoffice.com/GPG-KEY-ONLYOFFICE | gpg --dearmor | sudo tee /usr/share/keyrings/onlyoffice.gpg > /dev/null

    # Ajouter le dépôt OnlyOffice EE
    echo "📥 Ajout du dépôt OnlyOffice EE..."
    echo "deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main" | sudo tee /etc/apt/sources.list.d/onlyoffice.list

    # Mettre à jour la liste des paquets
    echo "🔄 Mise à jour des paquets..."
    apt update

    # Installer OnlyOffice EE
    echo "🚀 Installation de OnlyOffice Enterprise Edition..."
    ynh_package_install onlyoffice-documentserver-ee

    if [ $? -ne 0 ]; then
        echo "❌ Échec de l'installation de OnlyOffice EE"
        exit 1
    fi
}
#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
