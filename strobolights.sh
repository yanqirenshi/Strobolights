#!/bin/sh

TARGET_SCRIPT=/home/appl-user/prj/Strobolights/strobolights.lisp
LOG_DIR=/home/appl-user/var/log/strobolights/

BOOT_LOG=$LOG_DIR/boot.log

/usr/bin/sbcl --script $TARGET_SCRIPT >> $BOOT_LOG
