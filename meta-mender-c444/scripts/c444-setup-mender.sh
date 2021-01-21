# Mender Integration Setup Script
#
# Copyright 2019 NXP
# Copyright 2020 Mender Software Inc
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

. winsys-setup-release.sh $@

echo "" >>conf/bblayers.conf
echo "# Mender integration layers" >>conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-mender-community/meta-mender-c444 \"" >>conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-mender/meta-mender-core \"" >>conf/bblayers.conf

cat ../sources/meta-mender-community/templates/local.conf.append >>conf/local.conf
cat ../sources/meta-mender-community/meta-mender-c444/templates/local.conf.append >>conf/local.conf

# Adding extra layer (meta-c444-bgn)
# Unrelated to mender integration
echo "" >>conf/bblayers.conf
echo "# Custom layer to add HAB & DM-Crypt features" >>conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-mender-community/meta-c444-bgn \"" >>conf/bblayers.conf

cat ../sources/meta-mender-community/meta-c444-bgn/templates/local.conf.append >>conf/local.conf

echo ""
echo "Mender integration complete."
echo ""
