#!/bin/bash
rm -rf docs
flutter build web --output=docs --base-href=/pokezuka/
