# Copyright (C) 2014-2019 Linaro
# Released under the MIT license (see COPYING.MIT for the terms)

DESCRIPTION = "Linaro Qualcomm Landing team 4.19 Kernel"
LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"

inherit pythonnative

require recipes-kernel/linux/linux-linaro-qcom.inc
require recipes-kernel/linux/linux-qcom-bootimg.inc

LOCALVERSION ?= "-linaro-lt-qcom"
SRCBRANCH ?= "alimon/release/qcomlt-4.19"
#SRCREV ?= "8bdd343f96dc838eefba94a051e84c6db4d1c55d"
SRCREV ?= "${AUTOREV}"

COMPATIBLE_MACHINE = "(apq8016)"

# Wifi firmware has a recognizable arch :( 
ERROR_QA_remove = "arch"
