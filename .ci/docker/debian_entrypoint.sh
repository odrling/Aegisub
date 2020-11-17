#!/bin/sh -e

dpkg-buildpackage -nc

mv ../*.deb /out/
