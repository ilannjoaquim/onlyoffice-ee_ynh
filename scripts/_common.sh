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
    # Configuration pour Enterprise Edition
    echo onlyoffice-documentserver-ee onlyoffice/ds-port select "$port" | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/db-host string 127.0.0.1 | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/db-user string "$db_user" | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/db-pwd password "$db_pwd" | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/db-name string "$db_name" | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/jwt-enabled boolean true | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/jwt-secret password "$jwt_secret" | debconf-set-selections
    
    # Configuration Redis
    echo onlyoffice-documentserver-ee onlyoffice/redis-host string 127.0.0.1 | debconf-set-selections
    
    # Configuration RabbitMQ
    echo onlyoffice-documentserver-ee onlyoffice/rabbitmq-host string 127.0.0.1 | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/rabbitmq-user string guest | debconf-set-selections
    echo onlyoffice-documentserver-ee onlyoffice/rabbitmq-pwd password guest | debconf-set-selections

    # Installation du package Enterprise Edition
    ynh_package_install onlyoffice-documentserver-ee
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
