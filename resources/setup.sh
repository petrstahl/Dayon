#!/bin/sh
if [ ! `whoami` = "root" ]; then
	echo "This script must be run as super user - e.g. 'sudo sh setup.sh'"
	exit 77
fi

SHORTCUT_DIR=/usr/share/applications
if [ ! -d "$SHORTCUT_DIR" ]; then
	echo "Fatal: Unknown environment - '/usr/share/applications' not found."
	exit 78
fi

which java >/dev/null
if [ ! $? -eq 0 ]; then
	echo "***************************************************************************************"
	echo "* Important: Dayon! requires a Java Runtime Environment (JRE) to run.                 *"
	echo "* You will have to install a JRE afterwards - e.g. 'sudo apt-get install default-jre' *"
	echo "***************************************************************************************"
fi

INSTALL_DIR=$(dirname "$0")
if [ "$INSTALL_DIR" = "." ]; then
	INSTALL_DIR=`pwd`
fi
chmod +x $INSTALL_DIR/bin/*.sh

cat <<EOF > /usr/share/applications/DayonAssistant.desktop
[Desktop Entry]
Name=Dayon! Assistant
Exec=$INSTALL_DIR/bin/dayon_assistant.sh
Icon=$INSTALL_DIR/dayon.png
Terminal=false
Type=Application
Categories=Network;X-Communication;
Comment=Offer remote assistance
Comment[de]=Remotesupport anbieten
Comment[fr]=Offrir assistance à distance
Keywords=remote;support;offer help
EOF

cat <<EOF > /usr/share/applications/DayonAssisted.desktop
[Desktop Entry]
Name=Dayon! Assisted
Exec=$INSTALL_DIR/bin/dayon_assisted.sh
Icon=$INSTALL_DIR/dayon.png
Terminal=false
Type=Application
Categories=Network;X-Communication;
Comment=Request remote assistance
Comment[de]=Remotesupport erbitten
Comment[fr]=Demander assistance à distance
Keywords=remote;support;get help
EOF

echo "Dayon! setup finished successfully - happy sessions!"
