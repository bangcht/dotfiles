#!/bin/bash

touchpad_device="SynPS/2 Synaptics TouchPad"
state=`xinput list-props "$touchpad_device" | grep "Device Enabled" | grep -o "[01]$"`

if [ $state == '1' ];then
  xinput disable "$touchpad_device"
else
  xinput enable "$touchpad_device"
fi
