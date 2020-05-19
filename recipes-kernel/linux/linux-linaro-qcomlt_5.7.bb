# Copyright (C) 2014-2019 Linaro
# Released under the MIT license (see COPYING.MIT for the terms)

DESCRIPTION = "Linaro Qualcomm Landing team 5.7 Kernel"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

inherit pythonnative

require recipes-kernel/linux/linux-linaro-qcom.inc
require recipes-kernel/linux/linux-qcom-bootimg.inc

LOCALVERSION ?= "-linaro-lt-qcom"
SRCBRANCH ?= "alimon/tracking"
SRCREV ?= "d4ad54b4d4b1aabec001b04023a8726b253bf125"

COMPATIBLE_MACHINE = "(apq8016|apq8096|sdm845)"

# Wifi firmware has a recognizable arch :( 
ERROR_QA_remove = "arch"
