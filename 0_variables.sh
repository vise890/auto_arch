#!/bin/bash

export DISK='/dev/sda'

# The ESP (Efi System Partition) should be on "${DISK}1"
export ROOT_PARTITION="${DISK}2"

export ROOT_MOUNTPOINT="/mnt"

export NEW_HOSTNAME="renegade-box"

export LOCALTIME="UTC" # choose one from `tzselect` (e.g. Europe/London)
export LOCALE="en_GB.UTF-8"

export DEFAULT_USER="renegade"
export DEFAULT_PASSWORD="renegade"

# FIXME: this enables ssh *with password auth* for $DEFAULT_USER
export ENABLE_SSH=true
