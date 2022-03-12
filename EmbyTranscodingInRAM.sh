#!/bin/bash
mkdir /tmp/EmbyRamScratch
chmod -R 777 /tmp/EmbyRamScratch
mount -t tmpfs -o size=12g tmpfs /tmp/EmbyRamScratch
